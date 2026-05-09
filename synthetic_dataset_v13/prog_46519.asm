; DESCRIPTION: Renders a green line between points (398, 182) and (214, 122).
; PLAN: r0=398(x1), r1=182(y1), r2=214(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 182
LDI r2, 214
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
