; DESCRIPTION: Places a cyan line segment connecting (414, 36) to (189, 215).
; PLAN: r0=414(x1), r1=36(y1), r2=189(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 36
LDI r2, 189
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
