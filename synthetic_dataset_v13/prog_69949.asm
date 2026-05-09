; DESCRIPTION: Draws a black rectangle at (392, 234) with width 22 and height 18.
; PLAN: r0=392(x), r1=234(y), r2=22(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 234
LDI r2, 22
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
