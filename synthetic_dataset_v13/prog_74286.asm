; DESCRIPTION: Renders a white line between points (430, 187) and (202, 44).
; PLAN: r0=430(x1), r1=187(y1), r2=202(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 187
LDI r2, 202
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
