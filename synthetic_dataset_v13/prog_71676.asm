; DESCRIPTION: Renders a cyan line between points (21, 222) and (251, 53).
; PLAN: r0=21(x1), r1=222(y1), r2=251(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 222
LDI r2, 251
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
