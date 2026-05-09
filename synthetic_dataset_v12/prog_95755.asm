; DESCRIPTION: Draws a white line from (398, 142) to (313, 169).
; PLAN: r0=398(x1), r1=142(y1), r2=313(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 142
LDI r2, 313
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
