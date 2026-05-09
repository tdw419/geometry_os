; DESCRIPTION: Places a white line segment connecting (66, 70) to (479, 65).
; PLAN: r0=66(x1), r1=70(y1), r2=479(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 70
LDI r2, 479
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
