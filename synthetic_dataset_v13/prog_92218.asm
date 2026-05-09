; DESCRIPTION: Renders a white line between points (23, 161) and (202, 204).
; PLAN: r0=23(x1), r1=161(y1), r2=202(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 161
LDI r2, 202
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
