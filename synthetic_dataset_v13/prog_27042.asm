; DESCRIPTION: Renders a green line between points (204, 35) and (294, 171).
; PLAN: r0=204(x1), r1=35(y1), r2=294(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 35
LDI r2, 294
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
