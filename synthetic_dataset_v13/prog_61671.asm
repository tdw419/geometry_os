; DESCRIPTION: Draws a purple line from (183, 210) to (298, 176).
; PLAN: r0=183(x1), r1=210(y1), r2=298(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 210
LDI r2, 298
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
