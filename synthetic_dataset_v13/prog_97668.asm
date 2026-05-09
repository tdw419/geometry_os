; DESCRIPTION: Places a cyan line segment connecting (61, 121) to (269, 36).
; PLAN: r0=61(x1), r1=121(y1), r2=269(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 121
LDI r2, 269
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
