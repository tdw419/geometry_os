; DESCRIPTION: Renders a cyan line between points (151, 143) and (442, 74).
; PLAN: r0=151(x1), r1=143(y1), r2=442(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 143
LDI r2, 442
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
