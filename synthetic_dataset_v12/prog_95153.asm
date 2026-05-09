; DESCRIPTION: Places a cyan line segment connecting (106, 120) to (91, 63).
; PLAN: r0=106(x1), r1=120(y1), r2=91(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 120
LDI r2, 91
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
