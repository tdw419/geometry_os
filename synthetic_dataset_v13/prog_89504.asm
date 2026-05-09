; DESCRIPTION: Renders a yellow line between points (494, 168) and (298, 161).
; PLAN: r0=494(x1), r1=168(y1), r2=298(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 168
LDI r2, 298
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
