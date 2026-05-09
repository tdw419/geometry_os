; DESCRIPTION: Places a cyan line segment connecting (361, 154) to (33, 38).
; PLAN: r0=361(x1), r1=154(y1), r2=33(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 154
LDI r2, 33
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
