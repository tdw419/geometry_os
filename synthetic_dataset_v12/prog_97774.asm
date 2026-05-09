; DESCRIPTION: Places a cyan line segment connecting (153, 176) to (4, 214).
; PLAN: r0=153(x1), r1=176(y1), r2=4(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 176
LDI r2, 4
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
