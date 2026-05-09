; DESCRIPTION: Places a cyan line segment connecting (39, 169) to (464, 250).
; PLAN: r0=39(x1), r1=169(y1), r2=464(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 169
LDI r2, 464
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
