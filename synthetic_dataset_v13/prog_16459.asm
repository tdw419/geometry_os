; DESCRIPTION: Composite: Draws a cyan line from (404, 115) to (138, 214) then Sets a single yellow pixel at (54, 121).
; PLAN: r0=404(x1), r1=115(y1), r2=138(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=121(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 115
LDI r2, 138
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 121
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
