; DESCRIPTION: Places a yellow line segment connecting (479, 32) to (371, 171).
; PLAN: r0=479(x1), r1=32(y1), r2=371(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 32
LDI r2, 371
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
