; DESCRIPTION: Composite: Renders a white disk with center (250, 127) and radius 24 then Draws a cyan line from (377, 106) to (440, 116).
; PLAN: r0=250(x), r1=127(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=106(y1), r7=440(x2), r8=116(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 127
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 106
LDI r7, 440
LDI r8, 116
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
