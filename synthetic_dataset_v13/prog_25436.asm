; DESCRIPTION: Renders a cyan line between points (113, 39) and (87, 35).
; PLAN: r0=113(x1), r1=39(y1), r2=87(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 39
LDI r2, 87
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
