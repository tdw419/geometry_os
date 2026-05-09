; DESCRIPTION: Places a cyan line segment connecting (217, 101) to (384, 247).
; PLAN: r0=217(x1), r1=101(y1), r2=384(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 101
LDI r2, 384
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
