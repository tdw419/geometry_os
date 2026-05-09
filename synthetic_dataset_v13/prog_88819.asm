; DESCRIPTION: Places a cyan line segment connecting (61, 215) to (414, 148).
; PLAN: r0=61(x1), r1=215(y1), r2=414(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 215
LDI r2, 414
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
