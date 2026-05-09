; DESCRIPTION: Places a cyan line segment connecting (508, 114) to (271, 209).
; PLAN: r0=508(x1), r1=114(y1), r2=271(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 114
LDI r2, 271
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
