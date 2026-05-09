; DESCRIPTION: Renders a white line between points (344, 48) and (380, 127).
; PLAN: r0=344(x1), r1=48(y1), r2=380(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 48
LDI r2, 380
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
