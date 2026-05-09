; DESCRIPTION: Renders a cyan line between points (323, 224) and (274, 29).
; PLAN: r0=323(x1), r1=224(y1), r2=274(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 224
LDI r2, 274
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
