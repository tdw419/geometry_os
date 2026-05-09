; DESCRIPTION: Draws a yellow line from (298, 142) to (264, 187).
; PLAN: r0=298(x1), r1=142(y1), r2=264(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 142
LDI r2, 264
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
