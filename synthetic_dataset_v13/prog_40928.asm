; DESCRIPTION: Renders a yellow line between points (304, 152) and (0, 187).
; PLAN: r0=304(x1), r1=152(y1), r2=0(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 152
LDI r2, 0
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
