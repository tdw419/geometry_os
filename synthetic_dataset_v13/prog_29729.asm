; DESCRIPTION: Composite: Renders a black line between points (118, 64) and (379, 12) then Places a yellow dot at position (382, 86).
; PLAN: r0=118(x1), r1=64(y1), r2=379(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 64
LDI r2, 379
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
