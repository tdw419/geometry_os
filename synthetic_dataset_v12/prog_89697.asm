; DESCRIPTION: Places a cyan line segment connecting (416, 184) to (374, 25).
; PLAN: r0=416(x1), r1=184(y1), r2=374(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 184
LDI r2, 374
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
