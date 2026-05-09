; DESCRIPTION: Composite: Draws a white line from (99, 199) to (305, 242) then Sets a single yellow pixel at (38, 34).
; PLAN: r0=99(x1), r1=199(y1), r2=305(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=34(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 199
LDI r2, 305
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 34
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
