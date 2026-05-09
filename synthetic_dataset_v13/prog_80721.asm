; DESCRIPTION: Composite: Draws a red line from (102, 58) to (57, 28) then Sets a single purple pixel at (392, 174).
; PLAN: r0=102(x1), r1=58(y1), r2=57(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=174(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 58
LDI r2, 57
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 174
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
