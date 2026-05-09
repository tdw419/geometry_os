; DESCRIPTION: Renders a red line between points (365, 130) and (438, 255).
; PLAN: r0=365(x1), r1=130(y1), r2=438(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 130
LDI r2, 438
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
