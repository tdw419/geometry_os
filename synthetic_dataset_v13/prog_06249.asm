; DESCRIPTION: Renders a red line between points (106, 242) and (296, 16).
; PLAN: r0=106(x1), r1=242(y1), r2=296(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 242
LDI r2, 296
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
