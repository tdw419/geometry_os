; DESCRIPTION: Renders a cyan line between points (214, 194) and (166, 124).
; PLAN: r0=214(x1), r1=194(y1), r2=166(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 194
LDI r2, 166
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
