; DESCRIPTION: Places a cyan line segment connecting (157, 222) to (504, 214).
; PLAN: r0=157(x1), r1=222(y1), r2=504(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 222
LDI r2, 504
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
