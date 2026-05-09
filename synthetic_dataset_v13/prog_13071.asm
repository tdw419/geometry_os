; DESCRIPTION: Places a cyan line segment connecting (365, 254) to (74, 84).
; PLAN: r0=365(x1), r1=254(y1), r2=74(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 254
LDI r2, 74
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
