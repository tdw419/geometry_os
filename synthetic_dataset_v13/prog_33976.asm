; DESCRIPTION: Places a cyan line segment connecting (103, 120) to (355, 214).
; PLAN: r0=103(x1), r1=120(y1), r2=355(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 120
LDI r2, 355
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
