; DESCRIPTION: Places a blue line segment connecting (479, 111) to (231, 235).
; PLAN: r0=479(x1), r1=111(y1), r2=231(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 111
LDI r2, 231
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
