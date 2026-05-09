; DESCRIPTION: Composite: Places a magenta line segment connecting (210, 219) to (59, 158) then Places a orange dot at position (371, 0).
; PLAN: r0=210(x1), r1=219(y1), r2=59(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=0(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 219
LDI r2, 59
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 0
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
