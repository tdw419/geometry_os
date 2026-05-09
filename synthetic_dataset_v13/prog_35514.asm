; DESCRIPTION: Places a red line segment connecting (215, 129) to (289, 202).
; PLAN: r0=215(x1), r1=129(y1), r2=289(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 129
LDI r2, 289
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
