; DESCRIPTION: Draws a white line from (264, 79) to (243, 118).
; PLAN: r0=264(x1), r1=79(y1), r2=243(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 79
LDI r2, 243
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
