; DESCRIPTION: Renders a red line between points (46, 242) and (407, 98).
; PLAN: r0=46(x1), r1=242(y1), r2=407(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 242
LDI r2, 407
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
