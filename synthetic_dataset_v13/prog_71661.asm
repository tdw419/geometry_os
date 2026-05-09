; DESCRIPTION: Draws a white line from (225, 140) to (168, 126).
; PLAN: r0=225(x1), r1=140(y1), r2=168(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 140
LDI r2, 168
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
