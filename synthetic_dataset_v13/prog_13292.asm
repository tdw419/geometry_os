; DESCRIPTION: Composite: Places a black dot at position (388, 12) then Draws a cyan line from (312, 27) to (476, 175).
; PLAN: r0=388(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=27(y1), r7=476(x2), r8=175(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 27
LDI r7, 476
LDI r8, 175
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
