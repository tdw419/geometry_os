; DESCRIPTION: Places a cyan line segment connecting (464, 22) to (70, 75).
; PLAN: r0=464(x1), r1=22(y1), r2=70(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 22
LDI r2, 70
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
