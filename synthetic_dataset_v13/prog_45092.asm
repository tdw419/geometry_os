; DESCRIPTION: Composite: Places a cyan dot at position (174, 149) then Draws a black line from (181, 55) to (131, 195).
; PLAN: r0=174(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x1), r6=55(y1), r7=131(x2), r8=195(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 55
LDI r7, 131
LDI r8, 195
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
