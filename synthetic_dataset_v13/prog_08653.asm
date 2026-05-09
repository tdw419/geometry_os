; DESCRIPTION: Composite: Renders a yellow line between points (350, 162) and (276, 230) then Places a blue dot at position (376, 243).
; PLAN: r0=350(x1), r1=162(y1), r2=276(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 162
LDI r2, 276
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
