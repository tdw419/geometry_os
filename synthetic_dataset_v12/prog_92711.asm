; DESCRIPTION: Renders a cyan line between points (487, 123) and (12, 207).
; PLAN: r0=487(x1), r1=123(y1), r2=12(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 123
LDI r2, 12
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
