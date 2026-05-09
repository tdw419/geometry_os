; DESCRIPTION: Composite: Draws a green line from (5, 168) to (479, 162) then Creates a yellow circular shape at (247, 201) with radius 53.
; PLAN: r0=5(x1), r1=168(y1), r2=479(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=201(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 168
LDI r2, 479
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 201
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
