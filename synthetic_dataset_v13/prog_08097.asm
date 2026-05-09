; DESCRIPTION: Renders a cyan line between points (224, 249) and (473, 133).
; PLAN: r0=224(x1), r1=249(y1), r2=473(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 249
LDI r2, 473
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
