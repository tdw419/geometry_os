; DESCRIPTION: Draws a cyan rectangle at (72, 150) with width 35 and height 42.
; PLAN: r0=72(x), r1=150(y), r2=35(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 150
LDI r2, 35
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
