; DESCRIPTION: Renders a green line between points (153, 171) and (337, 215).
; PLAN: r0=153(x1), r1=171(y1), r2=337(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 171
LDI r2, 337
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
