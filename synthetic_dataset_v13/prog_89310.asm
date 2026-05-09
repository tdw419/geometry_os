; DESCRIPTION: Draws a yellow rectangle at (248, 160) with width 12 and height 10.
; PLAN: r0=248(x), r1=160(y), r2=12(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 160
LDI r2, 12
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
