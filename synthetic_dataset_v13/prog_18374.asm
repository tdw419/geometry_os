; DESCRIPTION: Places a cyan line segment connecting (250, 40) to (455, 215).
; PLAN: r0=250(x1), r1=40(y1), r2=455(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 40
LDI r2, 455
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
