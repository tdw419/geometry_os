; DESCRIPTION: Draws a white line from (168, 139) to (65, 193).
; PLAN: r0=168(x1), r1=139(y1), r2=65(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 139
LDI r2, 65
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
