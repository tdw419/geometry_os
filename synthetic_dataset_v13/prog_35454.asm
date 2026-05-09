; DESCRIPTION: Places a green line segment connecting (85, 179) to (295, 27).
; PLAN: r0=85(x1), r1=179(y1), r2=295(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 179
LDI r2, 295
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
