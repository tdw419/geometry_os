; DESCRIPTION: Renders a cyan line between points (123, 204) and (183, 234).
; PLAN: r0=123(x1), r1=204(y1), r2=183(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 204
LDI r2, 183
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
