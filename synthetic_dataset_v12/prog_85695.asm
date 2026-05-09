; DESCRIPTION: Places a cyan line segment connecting (11, 152) to (370, 44).
; PLAN: r0=11(x1), r1=152(y1), r2=370(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 152
LDI r2, 370
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
