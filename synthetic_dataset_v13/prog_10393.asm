; DESCRIPTION: Places a cyan line segment connecting (368, 171) to (486, 121).
; PLAN: r0=368(x1), r1=171(y1), r2=486(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 171
LDI r2, 486
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
