; DESCRIPTION: Draws a green line from (192, 140) to (67, 146).
; PLAN: r0=192(x1), r1=140(y1), r2=67(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 140
LDI r2, 67
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
