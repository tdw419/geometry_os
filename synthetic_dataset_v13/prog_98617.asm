; DESCRIPTION: Renders a cyan line between points (33, 103) and (214, 203).
; PLAN: r0=33(x1), r1=103(y1), r2=214(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 103
LDI r2, 214
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
