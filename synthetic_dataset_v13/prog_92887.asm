; DESCRIPTION: Places a green line segment connecting (458, 226) to (284, 195).
; PLAN: r0=458(x1), r1=226(y1), r2=284(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 226
LDI r2, 284
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
