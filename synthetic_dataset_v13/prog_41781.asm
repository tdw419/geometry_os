; DESCRIPTION: Places a yellow line segment connecting (66, 45) to (479, 192).
; PLAN: r0=66(x1), r1=45(y1), r2=479(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 45
LDI r2, 479
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
