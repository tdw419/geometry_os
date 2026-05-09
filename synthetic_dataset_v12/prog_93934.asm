; DESCRIPTION: Places a black line segment connecting (188, 190) to (42, 195).
; PLAN: r0=188(x1), r1=190(y1), r2=42(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 190
LDI r2, 42
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
