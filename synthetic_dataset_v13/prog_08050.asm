; DESCRIPTION: Composite: Draws a red line from (168, 56) to (316, 162) then Places a cyan dot at position (116, 60).
; PLAN: r0=168(x1), r1=56(y1), r2=316(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=60(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 56
LDI r2, 316
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 60
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
