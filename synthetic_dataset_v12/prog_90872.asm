; DESCRIPTION: Places a cyan line segment connecting (277, 138) to (268, 211).
; PLAN: r0=277(x1), r1=138(y1), r2=268(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 138
LDI r2, 268
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
