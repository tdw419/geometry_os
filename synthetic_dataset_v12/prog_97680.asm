; DESCRIPTION: Renders a magenta line between points (298, 205) and (458, 147).
; PLAN: r0=298(x1), r1=205(y1), r2=458(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 205
LDI r2, 458
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
