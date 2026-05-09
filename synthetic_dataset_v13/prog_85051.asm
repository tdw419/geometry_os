; DESCRIPTION: Places a cyan line segment connecting (442, 226) to (93, 166).
; PLAN: r0=442(x1), r1=226(y1), r2=93(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 226
LDI r2, 93
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
