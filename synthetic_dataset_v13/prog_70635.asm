; DESCRIPTION: Places a cyan line segment connecting (135, 208) to (33, 109).
; PLAN: r0=135(x1), r1=208(y1), r2=33(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 208
LDI r2, 33
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
