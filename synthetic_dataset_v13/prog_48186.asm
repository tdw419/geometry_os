; DESCRIPTION: Places a cyan line segment connecting (391, 55) to (189, 83).
; PLAN: r0=391(x1), r1=55(y1), r2=189(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 55
LDI r2, 189
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
