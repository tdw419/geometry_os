; DESCRIPTION: Renders a cyan line between points (453, 195) and (393, 41).
; PLAN: r0=453(x1), r1=195(y1), r2=393(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 195
LDI r2, 393
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
