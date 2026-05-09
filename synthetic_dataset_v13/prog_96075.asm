; DESCRIPTION: Composite: Draws a cyan line from (418, 103) to (28, 100) then Places a red dot at position (102, 85).
; PLAN: r0=418(x1), r1=103(y1), r2=28(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=85(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 418
LDI r1, 103
LDI r2, 28
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 85
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
