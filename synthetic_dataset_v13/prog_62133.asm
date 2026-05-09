; DESCRIPTION: Renders a cyan line between points (200, 47) and (307, 56).
; PLAN: r0=200(x1), r1=47(y1), r2=307(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 47
LDI r2, 307
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
