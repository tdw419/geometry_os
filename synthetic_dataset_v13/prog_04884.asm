; DESCRIPTION: Renders a cyan line between points (46, 183) and (458, 198).
; PLAN: r0=46(x1), r1=183(y1), r2=458(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 183
LDI r2, 458
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
