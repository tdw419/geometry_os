; DESCRIPTION: Renders a cyan line between points (303, 52) and (442, 102).
; PLAN: r0=303(x1), r1=52(y1), r2=442(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 52
LDI r2, 442
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
