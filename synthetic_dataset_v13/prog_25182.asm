; DESCRIPTION: Draws a black rectangle at (180, 33) with width 87 and height 108.
; PLAN: r0=180(x), r1=33(y), r2=87(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 33
LDI r2, 87
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
