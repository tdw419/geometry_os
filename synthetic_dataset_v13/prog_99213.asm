; DESCRIPTION: Composite: Renders a red disk with center (200, 168) and radius 10 then Renders a magenta line between points (54, 214) and (111, 155).
; PLAN: r0=200(x), r1=168(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x1), r6=214(y1), r7=111(x2), r8=155(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 168
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 214
LDI r7, 111
LDI r8, 155
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
