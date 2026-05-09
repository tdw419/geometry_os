; DESCRIPTION: Renders a red line between points (81, 215) and (354, 255).
; PLAN: r0=81(x1), r1=215(y1), r2=354(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 215
LDI r2, 354
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
