; DESCRIPTION: Draws a green line from (482, 146) to (180, 148).
; PLAN: r0=482(x1), r1=146(y1), r2=180(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 146
LDI r2, 180
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
