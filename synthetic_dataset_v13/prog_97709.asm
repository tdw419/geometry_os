; DESCRIPTION: Renders a green line between points (183, 124) and (493, 125).
; PLAN: r0=183(x1), r1=124(y1), r2=493(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 124
LDI r2, 493
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
