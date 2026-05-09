; DESCRIPTION: Renders a cyan line between points (10, 248) and (210, 93).
; PLAN: r0=10(x1), r1=248(y1), r2=210(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 248
LDI r2, 210
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
