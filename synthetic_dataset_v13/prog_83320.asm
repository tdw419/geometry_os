; DESCRIPTION: Draws a yellow rectangle at (328, 46) with width 86 and height 77.
; PLAN: r0=328(x), r1=46(y), r2=86(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 46
LDI r2, 86
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
