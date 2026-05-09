; DESCRIPTION: Places a cyan line segment connecting (263, 223) to (490, 124).
; PLAN: r0=263(x1), r1=223(y1), r2=490(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 223
LDI r2, 490
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
