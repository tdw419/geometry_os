; DESCRIPTION: Renders a cyan line between points (370, 75) and (245, 144).
; PLAN: r0=370(x1), r1=75(y1), r2=245(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 75
LDI r2, 245
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
