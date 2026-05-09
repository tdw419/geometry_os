; DESCRIPTION: Renders a red line between points (295, 212) and (374, 28).
; PLAN: r0=295(x1), r1=212(y1), r2=374(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 212
LDI r2, 374
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
