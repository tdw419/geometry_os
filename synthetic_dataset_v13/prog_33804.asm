; DESCRIPTION: Places a cyan line segment connecting (50, 233) to (289, 137).
; PLAN: r0=50(x1), r1=233(y1), r2=289(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 233
LDI r2, 289
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
