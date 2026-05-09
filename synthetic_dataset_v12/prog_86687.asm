; DESCRIPTION: Renders a cyan line between points (485, 182) and (44, 94).
; PLAN: r0=485(x1), r1=182(y1), r2=44(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 182
LDI r2, 44
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
