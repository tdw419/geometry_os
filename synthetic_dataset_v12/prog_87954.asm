; DESCRIPTION: Renders a cyan line between points (58, 39) and (39, 84).
; PLAN: r0=58(x1), r1=39(y1), r2=39(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 39
LDI r2, 39
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
