; DESCRIPTION: Renders a red line between points (166, 255) and (256, 82).
; PLAN: r0=166(x1), r1=255(y1), r2=256(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 255
LDI r2, 256
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
