; DESCRIPTION: Places a white line segment connecting (188, 182) to (173, 234).
; PLAN: r0=188(x1), r1=182(y1), r2=173(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 182
LDI r2, 173
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
