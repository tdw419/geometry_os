; DESCRIPTION: Places a green line segment connecting (352, 0) to (197, 150).
; PLAN: r0=352(x1), r1=0(y1), r2=197(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 0
LDI r2, 197
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
