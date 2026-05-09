; DESCRIPTION: Renders a cyan line between points (116, 126) and (32, 140).
; PLAN: r0=116(x1), r1=126(y1), r2=32(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 126
LDI r2, 32
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
