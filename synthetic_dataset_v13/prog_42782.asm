; DESCRIPTION: Composite: Places a black dot at position (379, 222) then Draws a black line from (465, 86) to (160, 133).
; PLAN: r0=379(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=465(x1), r6=86(y1), r7=160(x2), r8=133(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 465
LDI r6, 86
LDI r7, 160
LDI r8, 133
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
