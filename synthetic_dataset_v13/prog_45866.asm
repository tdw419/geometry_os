; DESCRIPTION: Renders a green line between points (207, 163) and (482, 198).
; PLAN: r0=207(x1), r1=163(y1), r2=482(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 163
LDI r2, 482
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
