; DESCRIPTION: Renders a white line between points (161, 176) and (384, 152).
; PLAN: r0=161(x1), r1=176(y1), r2=384(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 176
LDI r2, 384
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
