; DESCRIPTION: Places a cyan line segment connecting (54, 16) to (180, 136).
; PLAN: r0=54(x1), r1=16(y1), r2=180(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 16
LDI r2, 180
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
