; DESCRIPTION: Places a cyan line segment connecting (263, 64) to (102, 148).
; PLAN: r0=263(x1), r1=64(y1), r2=102(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 64
LDI r2, 102
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
