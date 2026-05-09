; DESCRIPTION: Places a cyan line segment connecting (444, 137) to (433, 230).
; PLAN: r0=444(x1), r1=137(y1), r2=433(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 137
LDI r2, 433
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
