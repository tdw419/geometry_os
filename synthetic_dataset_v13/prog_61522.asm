; DESCRIPTION: Places a cyan line segment connecting (384, 123) to (177, 193).
; PLAN: r0=384(x1), r1=123(y1), r2=177(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 123
LDI r2, 177
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
