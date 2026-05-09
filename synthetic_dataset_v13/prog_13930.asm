; DESCRIPTION: Places a cyan line segment connecting (5, 22) to (132, 95).
; PLAN: r0=5(x1), r1=22(y1), r2=132(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 22
LDI r2, 132
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
