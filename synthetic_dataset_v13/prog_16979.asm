; DESCRIPTION: Places a cyan line segment connecting (73, 3) to (13, 174).
; PLAN: r0=73(x1), r1=3(y1), r2=13(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 3
LDI r2, 13
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
