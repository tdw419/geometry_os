; DESCRIPTION: Composite: Places a cyan dot at position (269, 208) then Draws a black line from (238, 174) to (452, 173).
; PLAN: r0=269(x), r1=208(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=174(y1), r7=452(x2), r8=173(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 208
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 174
LDI r7, 452
LDI r8, 173
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
