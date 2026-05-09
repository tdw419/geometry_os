; DESCRIPTION: Renders a cyan line between points (215, 190) and (293, 112).
; PLAN: r0=215(x1), r1=190(y1), r2=293(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 190
LDI r2, 293
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
