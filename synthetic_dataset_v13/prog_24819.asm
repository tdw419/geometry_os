; DESCRIPTION: Composite: Draws a cyan line from (228, 151) to (440, 191) then Places a red dot at position (466, 130).
; PLAN: r0=228(x1), r1=151(y1), r2=440(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=130(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 151
LDI r2, 440
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 130
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
