; DESCRIPTION: Renders a cyan line between points (416, 141) and (76, 115).
; PLAN: r0=416(x1), r1=141(y1), r2=76(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 141
LDI r2, 76
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
