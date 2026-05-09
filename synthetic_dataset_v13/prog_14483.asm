; DESCRIPTION: Composite: Sets a single green pixel at (13, 171) then Renders a blue disk with center (80, 111) and radius 70 then Renders a magenta line between points (475, 168) and (463, 233).
; PLAN: r0=13(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=111(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=475(x1), r11=168(y1), r12=463(x2), r13=233(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 111
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 475
LDI r11, 168
LDI r12, 463
LDI r13, 233
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
