; DESCRIPTION: Places a cyan line segment connecting (403, 183) to (72, 214).
; PLAN: r0=403(x1), r1=183(y1), r2=72(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 183
LDI r2, 72
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
