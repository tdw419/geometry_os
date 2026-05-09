; DESCRIPTION: Places a black line segment connecting (393, 195) to (294, 148).
; PLAN: r0=393(x1), r1=195(y1), r2=294(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 195
LDI r2, 294
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
