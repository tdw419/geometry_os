; DESCRIPTION: Composite: Draws a cyan line from (435, 133) to (369, 128) then Sets a single orange pixel at (88, 235).
; PLAN: r0=435(x1), r1=133(y1), r2=369(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 133
LDI r2, 369
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
