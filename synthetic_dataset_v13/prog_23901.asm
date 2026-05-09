; DESCRIPTION: Draws a cyan line from (161, 166) to (353, 84).
; PLAN: r0=161(x1), r1=166(y1), r2=353(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 166
LDI r2, 353
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
