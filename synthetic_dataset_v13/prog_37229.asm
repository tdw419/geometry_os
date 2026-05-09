; DESCRIPTION: Renders a red line between points (424, 242) and (400, 234).
; PLAN: r0=424(x1), r1=242(y1), r2=400(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 242
LDI r2, 400
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
