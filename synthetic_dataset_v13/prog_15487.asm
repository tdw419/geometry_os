; DESCRIPTION: Renders a white line between points (281, 11) and (2, 242).
; PLAN: r0=281(x1), r1=11(y1), r2=2(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 11
LDI r2, 2
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
