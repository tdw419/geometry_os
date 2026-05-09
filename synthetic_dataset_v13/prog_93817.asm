; DESCRIPTION: Places a white line segment connecting (479, 252) to (256, 27).
; PLAN: r0=479(x1), r1=252(y1), r2=256(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 252
LDI r2, 256
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
