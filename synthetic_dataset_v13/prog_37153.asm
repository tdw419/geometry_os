; DESCRIPTION: Draws a white line from (305, 214) to (258, 58).
; PLAN: r0=305(x1), r1=214(y1), r2=258(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 214
LDI r2, 258
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
