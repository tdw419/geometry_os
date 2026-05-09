; DESCRIPTION: Renders a cyan line between points (344, 111) and (143, 93).
; PLAN: r0=344(x1), r1=111(y1), r2=143(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 111
LDI r2, 143
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
