; DESCRIPTION: Places a cyan line segment connecting (204, 62) to (182, 92).
; PLAN: r0=204(x1), r1=62(y1), r2=182(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 62
LDI r2, 182
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
