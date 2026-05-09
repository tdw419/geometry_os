; DESCRIPTION: Draws a white line from (78, 178) to (298, 242).
; PLAN: r0=78(x1), r1=178(y1), r2=298(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 178
LDI r2, 298
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
