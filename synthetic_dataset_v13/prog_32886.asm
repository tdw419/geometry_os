; DESCRIPTION: Renders a magenta line between points (301, 242) and (178, 176).
; PLAN: r0=301(x1), r1=242(y1), r2=178(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 242
LDI r2, 178
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
