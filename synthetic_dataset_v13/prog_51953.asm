; DESCRIPTION: Renders a cyan line between points (19, 122) and (305, 144).
; PLAN: r0=19(x1), r1=122(y1), r2=305(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 122
LDI r2, 305
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
