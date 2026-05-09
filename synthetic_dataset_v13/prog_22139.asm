; DESCRIPTION: Places a cyan line segment connecting (470, 30) to (431, 6).
; PLAN: r0=470(x1), r1=30(y1), r2=431(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 30
LDI r2, 431
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
