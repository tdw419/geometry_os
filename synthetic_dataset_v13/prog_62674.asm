; DESCRIPTION: Places a cyan line segment connecting (222, 211) to (300, 5).
; PLAN: r0=222(x1), r1=211(y1), r2=300(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 211
LDI r2, 300
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
