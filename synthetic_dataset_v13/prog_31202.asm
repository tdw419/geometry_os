; DESCRIPTION: Places a cyan line segment connecting (392, 54) to (211, 51).
; PLAN: r0=392(x1), r1=54(y1), r2=211(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 54
LDI r2, 211
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
