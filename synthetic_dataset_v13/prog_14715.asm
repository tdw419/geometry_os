; DESCRIPTION: Places a cyan line segment connecting (352, 62) to (25, 180).
; PLAN: r0=352(x1), r1=62(y1), r2=25(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 62
LDI r2, 25
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
