; DESCRIPTION: Places a cyan line segment connecting (332, 173) to (292, 36).
; PLAN: r0=332(x1), r1=173(y1), r2=292(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 173
LDI r2, 292
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
