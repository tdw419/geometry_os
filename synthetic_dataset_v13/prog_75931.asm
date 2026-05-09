; DESCRIPTION: Places a white line segment connecting (255, 193) to (479, 159).
; PLAN: r0=255(x1), r1=193(y1), r2=479(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 193
LDI r2, 479
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
