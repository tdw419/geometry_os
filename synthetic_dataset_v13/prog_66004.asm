; DESCRIPTION: Draws a magenta line from (409, 245) to (509, 209).
; PLAN: r0=409(x1), r1=245(y1), r2=509(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 245
LDI r2, 509
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
