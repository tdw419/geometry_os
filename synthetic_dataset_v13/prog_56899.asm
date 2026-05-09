; DESCRIPTION: Draws a yellow line from (298, 171) to (110, 177).
; PLAN: r0=298(x1), r1=171(y1), r2=110(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 171
LDI r2, 110
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
