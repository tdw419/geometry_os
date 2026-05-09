; DESCRIPTION: Composite: Places a cyan circle of radius 55 at center (168, 57) then Renders a purple line between points (250, 150) and (391, 155).
; PLAN: r0=168(x), r1=57(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=150(y1), r7=391(x2), r8=155(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 57
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 150
LDI r7, 391
LDI r8, 155
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
