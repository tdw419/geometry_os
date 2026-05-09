; DESCRIPTION: Renders a white line between points (412, 242) and (193, 205).
; PLAN: r0=412(x1), r1=242(y1), r2=193(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 242
LDI r2, 193
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
