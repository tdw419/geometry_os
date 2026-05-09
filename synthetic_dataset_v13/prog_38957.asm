; DESCRIPTION: Draws a yellow line from (487, 43) to (302, 190).
; PLAN: r0=487(x1), r1=43(y1), r2=302(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 43
LDI r2, 302
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
