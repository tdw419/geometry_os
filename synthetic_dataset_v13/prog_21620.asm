; DESCRIPTION: Renders a cyan line between points (273, 82) and (470, 17).
; PLAN: r0=273(x1), r1=82(y1), r2=470(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 82
LDI r2, 470
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
