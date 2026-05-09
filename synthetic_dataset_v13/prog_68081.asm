; DESCRIPTION: Places a cyan line segment connecting (313, 182) to (288, 48).
; PLAN: r0=313(x1), r1=182(y1), r2=288(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 182
LDI r2, 288
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
