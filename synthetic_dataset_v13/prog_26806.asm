; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (232, 222) then Draws a orange line from (271, 128) to (330, 247).
; PLAN: r0=232(x), r1=222(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=128(y1), r7=330(x2), r8=247(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 222
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 128
LDI r7, 330
LDI r8, 247
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
