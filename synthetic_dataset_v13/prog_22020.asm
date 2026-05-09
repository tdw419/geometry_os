; DESCRIPTION: Draws a green line from (197, 86) to (237, 153).
; PLAN: r0=197(x1), r1=86(y1), r2=237(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 86
LDI r2, 237
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
