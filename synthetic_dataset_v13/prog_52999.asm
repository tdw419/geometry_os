; DESCRIPTION: Composite: Draws a white line from (416, 79) to (169, 246) then Sets a single cyan pixel at (115, 22).
; PLAN: r0=416(x1), r1=79(y1), r2=169(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=22(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 79
LDI r2, 169
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 22
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
