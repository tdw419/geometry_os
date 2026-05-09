; DESCRIPTION: Draws a green line from (68, 123) to (284, 243).
; PLAN: r0=68(x1), r1=123(y1), r2=284(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 123
LDI r2, 284
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
