; DESCRIPTION: Places a cyan line segment connecting (77, 101) to (403, 243).
; PLAN: r0=77(x1), r1=101(y1), r2=403(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 101
LDI r2, 403
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
