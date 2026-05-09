; DESCRIPTION: Renders a cyan line between points (496, 102) and (468, 125).
; PLAN: r0=496(x1), r1=102(y1), r2=468(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 102
LDI r2, 468
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
