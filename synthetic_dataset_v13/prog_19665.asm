; DESCRIPTION: Renders a cyan line between points (337, 154) and (321, 241).
; PLAN: r0=337(x1), r1=154(y1), r2=321(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 154
LDI r2, 321
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
