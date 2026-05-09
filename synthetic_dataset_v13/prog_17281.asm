; DESCRIPTION: Renders a cyan line between points (215, 45) and (124, 170).
; PLAN: r0=215(x1), r1=45(y1), r2=124(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 45
LDI r2, 124
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
