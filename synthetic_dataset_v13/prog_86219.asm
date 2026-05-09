; DESCRIPTION: Places a cyan line segment connecting (336, 1) to (303, 83).
; PLAN: r0=336(x1), r1=1(y1), r2=303(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 1
LDI r2, 303
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
