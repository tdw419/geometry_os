; DESCRIPTION: Draws a green line from (213, 171) to (482, 54).
; PLAN: r0=213(x1), r1=171(y1), r2=482(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 171
LDI r2, 482
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
