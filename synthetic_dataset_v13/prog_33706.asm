; DESCRIPTION: Draws a green line from (329, 16) to (409, 68).
; PLAN: r0=329(x1), r1=16(y1), r2=409(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 16
LDI r2, 409
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
