; DESCRIPTION: Renders a cyan line between points (435, 143) and (164, 6).
; PLAN: r0=435(x1), r1=143(y1), r2=164(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 143
LDI r2, 164
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
