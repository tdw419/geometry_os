; DESCRIPTION: Places a white line segment connecting (164, 123) to (479, 195).
; PLAN: r0=164(x1), r1=123(y1), r2=479(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 123
LDI r2, 479
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
