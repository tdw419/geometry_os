; DESCRIPTION: Renders a magenta line between points (218, 240) and (298, 107).
; PLAN: r0=218(x1), r1=240(y1), r2=298(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 240
LDI r2, 298
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
