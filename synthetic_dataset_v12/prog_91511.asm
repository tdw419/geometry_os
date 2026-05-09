; DESCRIPTION: Composite: Places a yellow circle of radius 78 at center (198, 168) then Renders a magenta line between points (362, 225) and (20, 212).
; PLAN: r0=198(x), r1=168(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x1), r6=225(y1), r7=20(x2), r8=212(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 168
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 225
LDI r7, 20
LDI r8, 212
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
