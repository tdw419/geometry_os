; DESCRIPTION: Draws a white line from (337, 111) to (442, 59).
; PLAN: r0=337(x1), r1=111(y1), r2=442(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 111
LDI r2, 442
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
