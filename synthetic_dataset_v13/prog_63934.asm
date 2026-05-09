; DESCRIPTION: Renders a white line between points (60, 231) and (12, 195).
; PLAN: r0=60(x1), r1=231(y1), r2=12(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 231
LDI r2, 12
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
