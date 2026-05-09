; DESCRIPTION: Renders a magenta line between points (298, 121) and (475, 14).
; PLAN: r0=298(x1), r1=121(y1), r2=475(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 121
LDI r2, 475
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
