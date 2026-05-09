; DESCRIPTION: Draws a white line from (70, 33) to (160, 170).
; PLAN: r0=70(x1), r1=33(y1), r2=160(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 33
LDI r2, 160
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
