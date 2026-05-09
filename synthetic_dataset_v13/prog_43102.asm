; DESCRIPTION: Renders a black line between points (298, 182) and (236, 134).
; PLAN: r0=298(x1), r1=182(y1), r2=236(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 182
LDI r2, 236
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
