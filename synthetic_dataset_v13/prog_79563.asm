; DESCRIPTION: Places a green line segment connecting (42, 162) to (190, 178).
; PLAN: r0=42(x1), r1=162(y1), r2=190(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 162
LDI r2, 190
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
