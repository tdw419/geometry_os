; DESCRIPTION: Places a cyan line segment connecting (359, 197) to (475, 16).
; PLAN: r0=359(x1), r1=197(y1), r2=475(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 197
LDI r2, 475
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
