; DESCRIPTION: Places a yellow line segment connecting (487, 161) to (215, 243).
; PLAN: r0=487(x1), r1=161(y1), r2=215(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 161
LDI r2, 215
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
