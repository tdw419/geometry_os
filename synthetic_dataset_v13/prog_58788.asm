; DESCRIPTION: Draws a white line from (345, 231) to (372, 239).
; PLAN: r0=345(x1), r1=231(y1), r2=372(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 231
LDI r2, 372
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
