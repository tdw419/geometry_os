; DESCRIPTION: Composite: Draws a red line from (5, 207) to (79, 121) then Sets a single cyan pixel at (91, 57).
; PLAN: r0=5(x1), r1=207(y1), r2=79(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 207
LDI r2, 79
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
