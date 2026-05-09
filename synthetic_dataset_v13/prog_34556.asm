; DESCRIPTION: Places a cyan line segment connecting (373, 96) to (286, 33).
; PLAN: r0=373(x1), r1=96(y1), r2=286(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 96
LDI r2, 286
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
