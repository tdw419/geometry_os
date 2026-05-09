; DESCRIPTION: Renders a cyan line between points (244, 217) and (202, 53).
; PLAN: r0=244(x1), r1=217(y1), r2=202(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 217
LDI r2, 202
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
