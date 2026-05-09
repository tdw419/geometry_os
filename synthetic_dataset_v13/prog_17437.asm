; DESCRIPTION: Renders a white line between points (242, 205) and (272, 11).
; PLAN: r0=242(x1), r1=205(y1), r2=272(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 205
LDI r2, 272
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
