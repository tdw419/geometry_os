; DESCRIPTION: Renders a white line between points (481, 16) and (344, 197).
; PLAN: r0=481(x1), r1=16(y1), r2=344(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 16
LDI r2, 344
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
