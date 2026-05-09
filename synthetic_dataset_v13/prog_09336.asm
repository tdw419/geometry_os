; DESCRIPTION: Renders a cyan line between points (102, 27) and (273, 41).
; PLAN: r0=102(x1), r1=27(y1), r2=273(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 27
LDI r2, 273
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
