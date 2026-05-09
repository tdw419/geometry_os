; DESCRIPTION: Renders a cyan line between points (12, 106) and (71, 173).
; PLAN: r0=12(x1), r1=106(y1), r2=71(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 106
LDI r2, 71
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
