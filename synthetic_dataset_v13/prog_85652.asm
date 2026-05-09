; DESCRIPTION: Places a cyan line segment connecting (311, 113) to (281, 48).
; PLAN: r0=311(x1), r1=113(y1), r2=281(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 113
LDI r2, 281
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
