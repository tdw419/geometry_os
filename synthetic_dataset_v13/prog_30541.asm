; DESCRIPTION: Places a cyan line segment connecting (336, 208) to (332, 202).
; PLAN: r0=336(x1), r1=208(y1), r2=332(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 208
LDI r2, 332
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
