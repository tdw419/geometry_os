; DESCRIPTION: Renders a white line between points (492, 207) and (281, 71).
; PLAN: r0=492(x1), r1=207(y1), r2=281(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 207
LDI r2, 281
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
