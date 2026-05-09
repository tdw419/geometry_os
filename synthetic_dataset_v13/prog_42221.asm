; DESCRIPTION: Places a cyan line segment connecting (204, 105) to (71, 16).
; PLAN: r0=204(x1), r1=105(y1), r2=71(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 105
LDI r2, 71
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
