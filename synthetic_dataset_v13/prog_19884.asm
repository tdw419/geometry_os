; DESCRIPTION: Renders a red line between points (192, 173) and (374, 236).
; PLAN: r0=192(x1), r1=173(y1), r2=374(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 173
LDI r2, 374
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
