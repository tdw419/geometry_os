; DESCRIPTION: Composite: Places a black dot at position (259, 108) then Draws a yellow line from (454, 73) to (274, 163).
; PLAN: r0=259(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=454(x1), r6=73(y1), r7=274(x2), r8=163(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 454
LDI r6, 73
LDI r7, 274
LDI r8, 163
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
