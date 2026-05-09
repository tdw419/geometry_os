; DESCRIPTION: Draws a black rectangle at (446, 2) with width 42 and height 79.
; PLAN: r0=446(x), r1=2(y), r2=42(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 2
LDI r2, 42
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
