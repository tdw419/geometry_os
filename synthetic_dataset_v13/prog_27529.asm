; DESCRIPTION: Draws a magenta line from (378, 21) to (298, 71).
; PLAN: r0=378(x1), r1=21(y1), r2=298(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 21
LDI r2, 298
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
