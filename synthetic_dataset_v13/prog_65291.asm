; DESCRIPTION: Renders a green line between points (258, 202) and (397, 125).
; PLAN: r0=258(x1), r1=202(y1), r2=397(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 202
LDI r2, 397
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
