; DESCRIPTION: Draws a green line from (330, 243) to (314, 213).
; PLAN: r0=330(x1), r1=243(y1), r2=314(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 243
LDI r2, 314
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
