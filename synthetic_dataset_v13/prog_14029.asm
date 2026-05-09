; DESCRIPTION: Renders a white line between points (294, 166) and (121, 241).
; PLAN: r0=294(x1), r1=166(y1), r2=121(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 166
LDI r2, 121
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
