; DESCRIPTION: Draws a yellow line from (354, 27) to (223, 243).
; PLAN: r0=354(x1), r1=27(y1), r2=223(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 27
LDI r2, 223
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
