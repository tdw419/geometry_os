; DESCRIPTION: Renders a cyan line between points (337, 141) and (37, 56).
; PLAN: r0=337(x1), r1=141(y1), r2=37(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 141
LDI r2, 37
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
