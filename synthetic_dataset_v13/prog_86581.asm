; DESCRIPTION: Composite: Places a blue dot at position (344, 146) then Renders a black line between points (422, 254) and (273, 97).
; PLAN: r0=344(x), r1=146(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=254(y1), r7=273(x2), r8=97(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 146
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 254
LDI r7, 273
LDI r8, 97
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
