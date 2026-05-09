; DESCRIPTION: Places a cyan line segment connecting (358, 173) to (75, 20).
; PLAN: r0=358(x1), r1=173(y1), r2=75(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 173
LDI r2, 75
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
