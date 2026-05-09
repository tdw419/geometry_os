; DESCRIPTION: Draws a yellow line from (305, 224) to (223, 210).
; PLAN: r0=305(x1), r1=224(y1), r2=223(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 224
LDI r2, 223
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
