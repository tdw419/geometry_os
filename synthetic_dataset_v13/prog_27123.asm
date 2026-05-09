; DESCRIPTION: Draws a green line from (435, 129) to (11, 37).
; PLAN: r0=435(x1), r1=129(y1), r2=11(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 129
LDI r2, 11
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
