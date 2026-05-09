; DESCRIPTION: Renders a cyan line between points (82, 71) and (368, 4).
; PLAN: r0=82(x1), r1=71(y1), r2=368(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 71
LDI r2, 368
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
