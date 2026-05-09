; DESCRIPTION: Renders a cyan line between points (505, 127) and (21, 23).
; PLAN: r0=505(x1), r1=127(y1), r2=21(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 127
LDI r2, 21
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
