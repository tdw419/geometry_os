; DESCRIPTION: Draws a black rectangle at (243, 48) with width 15 and height 42.
; PLAN: r0=243(x), r1=48(y), r2=15(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 48
LDI r2, 15
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
