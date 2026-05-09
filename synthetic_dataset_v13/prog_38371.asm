; DESCRIPTION: Places a cyan line segment connecting (195, 127) to (248, 178).
; PLAN: r0=195(x1), r1=127(y1), r2=248(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 127
LDI r2, 248
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
