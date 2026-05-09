; DESCRIPTION: Renders a cyan line between points (33, 0) and (166, 204).
; PLAN: r0=33(x1), r1=0(y1), r2=166(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 0
LDI r2, 166
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
