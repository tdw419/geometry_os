; DESCRIPTION: Composite: Places a white dot at position (223, 198) then Renders a purple line between points (320, 168) and (111, 237).
; PLAN: r0=223(x), r1=198(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=168(y1), r7=111(x2), r8=237(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 198
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 168
LDI r7, 111
LDI r8, 237
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
