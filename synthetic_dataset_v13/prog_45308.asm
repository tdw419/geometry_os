; DESCRIPTION: Composite: Places a yellow dot at position (40, 132) then Renders a blue line between points (446, 146) and (338, 129).
; PLAN: r0=40(x), r1=132(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=146(y1), r7=338(x2), r8=129(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 132
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 446
LDI r6, 146
LDI r7, 338
LDI r8, 129
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
