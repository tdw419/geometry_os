; DESCRIPTION: Renders a green line between points (398, 182) and (475, 39).
; PLAN: r0=398(x1), r1=182(y1), r2=475(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 182
LDI r2, 475
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
