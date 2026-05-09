; DESCRIPTION: Places a cyan line segment connecting (266, 182) to (403, 252).
; PLAN: r0=266(x1), r1=182(y1), r2=403(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 182
LDI r2, 403
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
