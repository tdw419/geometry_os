; DESCRIPTION: Renders a cyan line between points (48, 86) and (15, 244).
; PLAN: r0=48(x1), r1=86(y1), r2=15(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 86
LDI r2, 15
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
