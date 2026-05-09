; DESCRIPTION: Renders a red line between points (269, 126) and (461, 231).
; PLAN: r0=269(x1), r1=126(y1), r2=461(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 126
LDI r2, 461
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
