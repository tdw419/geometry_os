; DESCRIPTION: Places a magenta line segment connecting (439, 16) to (294, 121).
; PLAN: r0=439(x1), r1=16(y1), r2=294(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 16
LDI r2, 294
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
