; DESCRIPTION: Draws a cyan line from (151, 208) to (353, 155).
; PLAN: r0=151(x1), r1=208(y1), r2=353(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 208
LDI r2, 353
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
