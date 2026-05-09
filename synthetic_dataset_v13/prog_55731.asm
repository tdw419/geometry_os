; DESCRIPTION: Renders a magenta line between points (410, 230) and (504, 155).
; PLAN: r0=410(x1), r1=230(y1), r2=504(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 230
LDI r2, 504
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
