; DESCRIPTION: Draws a white line from (206, 38) to (280, 240).
; PLAN: r0=206(x1), r1=38(y1), r2=280(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 38
LDI r2, 280
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
