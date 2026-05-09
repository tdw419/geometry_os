; DESCRIPTION: Renders a cyan line between points (39, 93) and (450, 241).
; PLAN: r0=39(x1), r1=93(y1), r2=450(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 93
LDI r2, 450
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
