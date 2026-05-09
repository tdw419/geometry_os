; DESCRIPTION: Places a cyan line segment connecting (186, 142) to (179, 91).
; PLAN: r0=186(x1), r1=142(y1), r2=179(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 142
LDI r2, 179
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
