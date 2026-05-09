; DESCRIPTION: Places a cyan line segment connecting (214, 176) to (47, 57).
; PLAN: r0=214(x1), r1=176(y1), r2=47(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 176
LDI r2, 47
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
