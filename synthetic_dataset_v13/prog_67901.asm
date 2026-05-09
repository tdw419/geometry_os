; DESCRIPTION: Composite: Draws a magenta line from (422, 36) to (182, 178) then Draws a cyan circle centered at (201, 180) with radius 33.
; PLAN: r0=422(x1), r1=36(y1), r2=182(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=180(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 36
LDI r2, 182
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 180
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
