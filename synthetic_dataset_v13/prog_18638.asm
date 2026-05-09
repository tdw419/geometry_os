; DESCRIPTION: Places a green line segment connecting (418, 171) to (370, 213).
; PLAN: r0=418(x1), r1=171(y1), r2=370(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 171
LDI r2, 370
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
