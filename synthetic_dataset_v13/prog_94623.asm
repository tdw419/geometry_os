; DESCRIPTION: Places a cyan line segment connecting (369, 143) to (53, 24).
; PLAN: r0=369(x1), r1=143(y1), r2=53(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 143
LDI r2, 53
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
