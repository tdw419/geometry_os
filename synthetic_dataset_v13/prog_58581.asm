; DESCRIPTION: Draws a green line from (123, 245) to (21, 234).
; PLAN: r0=123(x1), r1=245(y1), r2=21(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 245
LDI r2, 21
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
