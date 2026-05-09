; DESCRIPTION: Renders a green line between points (187, 248) and (103, 77).
; PLAN: r0=187(x1), r1=248(y1), r2=103(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 248
LDI r2, 103
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
