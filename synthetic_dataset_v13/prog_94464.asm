; DESCRIPTION: Places a cyan line segment connecting (407, 179) to (502, 148).
; PLAN: r0=407(x1), r1=179(y1), r2=502(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 179
LDI r2, 502
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
