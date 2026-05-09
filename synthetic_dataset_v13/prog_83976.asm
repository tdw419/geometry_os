; DESCRIPTION: Places a white line segment connecting (479, 118) to (305, 162).
; PLAN: r0=479(x1), r1=118(y1), r2=305(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 118
LDI r2, 305
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
