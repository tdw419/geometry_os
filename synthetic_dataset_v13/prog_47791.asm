; DESCRIPTION: Renders a red line between points (404, 125) and (224, 151).
; PLAN: r0=404(x1), r1=125(y1), r2=224(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 125
LDI r2, 224
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
