; DESCRIPTION: Places a green line segment connecting (28, 187) to (197, 171).
; PLAN: r0=28(x1), r1=187(y1), r2=197(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 187
LDI r2, 197
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
