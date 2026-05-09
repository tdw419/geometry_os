; DESCRIPTION: Draws a white line from (457, 151) to (27, 237).
; PLAN: r0=457(x1), r1=151(y1), r2=27(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 151
LDI r2, 27
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
