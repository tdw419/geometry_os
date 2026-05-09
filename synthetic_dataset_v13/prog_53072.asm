; DESCRIPTION: Places a cyan line segment connecting (450, 237) to (14, 38).
; PLAN: r0=450(x1), r1=237(y1), r2=14(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 237
LDI r2, 14
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
