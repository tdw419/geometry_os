; DESCRIPTION: Places a cyan line segment connecting (154, 171) to (414, 7).
; PLAN: r0=154(x1), r1=171(y1), r2=414(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 171
LDI r2, 414
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
