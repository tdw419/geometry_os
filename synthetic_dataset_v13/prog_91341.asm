; DESCRIPTION: Draws a white line from (105, 205) to (392, 29).
; PLAN: r0=105(x1), r1=205(y1), r2=392(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 205
LDI r2, 392
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
