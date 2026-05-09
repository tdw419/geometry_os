; DESCRIPTION: Draws a green line from (446, 171) to (103, 176).
; PLAN: r0=446(x1), r1=171(y1), r2=103(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 171
LDI r2, 103
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
