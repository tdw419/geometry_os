; DESCRIPTION: Places a yellow line segment connecting (392, 223) to (214, 165).
; PLAN: r0=392(x1), r1=223(y1), r2=214(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 223
LDI r2, 214
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
