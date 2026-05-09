; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (342, 106) then Renders a green line between points (385, 131) and (152, 223).
; PLAN: r0=342(x), r1=106(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=131(y1), r7=152(x2), r8=223(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 106
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 131
LDI r7, 152
LDI r8, 223
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
