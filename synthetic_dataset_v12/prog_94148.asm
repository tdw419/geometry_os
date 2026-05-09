; DESCRIPTION: Draws a white line from (245, 59) to (487, 188).
; PLAN: r0=245(x1), r1=59(y1), r2=487(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 59
LDI r2, 487
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
