; DESCRIPTION: Composite: Places a red circle of radius 18 at center (252, 219) then Draws a magenta line from (291, 71) to (441, 152).
; PLAN: r0=252(x), r1=219(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x1), r6=71(y1), r7=441(x2), r8=152(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 219
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 71
LDI r7, 441
LDI r8, 152
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
