; DESCRIPTION: Renders a white line between points (213, 65) and (298, 167).
; PLAN: r0=213(x1), r1=65(y1), r2=298(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 65
LDI r2, 298
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
