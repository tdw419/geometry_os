; DESCRIPTION: Composite: Places a cyan dot at position (368, 209) then Draws a black line from (37, 102) to (19, 175).
; PLAN: r0=368(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=102(y1), r7=19(x2), r8=175(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 37
LDI r6, 102
LDI r7, 19
LDI r8, 175
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
