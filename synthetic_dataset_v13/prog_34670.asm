; DESCRIPTION: Renders a cyan line between points (120, 36) and (224, 15).
; PLAN: r0=120(x1), r1=36(y1), r2=224(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 36
LDI r2, 224
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
