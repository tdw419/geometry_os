; DESCRIPTION: Places a cyan line segment connecting (179, 233) to (470, 178).
; PLAN: r0=179(x1), r1=233(y1), r2=470(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 233
LDI r2, 470
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
