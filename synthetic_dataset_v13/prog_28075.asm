; DESCRIPTION: Renders a purple line between points (504, 67) and (309, 171).
; PLAN: r0=504(x1), r1=67(y1), r2=309(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 67
LDI r2, 309
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
