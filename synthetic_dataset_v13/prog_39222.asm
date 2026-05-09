; DESCRIPTION: Renders a cyan line between points (122, 93) and (224, 215).
; PLAN: r0=122(x1), r1=93(y1), r2=224(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 93
LDI r2, 224
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
