; DESCRIPTION: Composite: Draws a black line from (248, 152) to (89, 209) then Places a blue dot at position (379, 86).
; PLAN: r0=248(x1), r1=152(y1), r2=89(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=86(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 152
LDI r2, 89
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 86
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
