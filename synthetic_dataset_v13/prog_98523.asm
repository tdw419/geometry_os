; DESCRIPTION: Places a cyan line segment connecting (52, 112) to (176, 38).
; PLAN: r0=52(x1), r1=112(y1), r2=176(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 112
LDI r2, 176
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
