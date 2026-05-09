; DESCRIPTION: Draws a white line from (425, 231) to (421, 93).
; PLAN: r0=425(x1), r1=231(y1), r2=421(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 231
LDI r2, 421
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
