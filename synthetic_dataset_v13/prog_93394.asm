; DESCRIPTION: Renders a cyan line between points (430, 10) and (224, 32).
; PLAN: r0=430(x1), r1=10(y1), r2=224(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 10
LDI r2, 224
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
