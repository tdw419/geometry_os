; DESCRIPTION: Draws a white line from (237, 108) to (398, 222).
; PLAN: r0=237(x1), r1=108(y1), r2=398(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 108
LDI r2, 398
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
