; DESCRIPTION: Places a cyan line segment connecting (165, 90) to (374, 183).
; PLAN: r0=165(x1), r1=90(y1), r2=374(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 90
LDI r2, 374
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
