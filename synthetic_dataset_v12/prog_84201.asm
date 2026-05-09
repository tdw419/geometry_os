; DESCRIPTION: Renders a cyan line between points (31, 44) and (346, 133).
; PLAN: r0=31(x1), r1=44(y1), r2=346(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 44
LDI r2, 346
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
