; DESCRIPTION: Places a cyan line segment connecting (455, 220) to (15, 214).
; PLAN: r0=455(x1), r1=220(y1), r2=15(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 220
LDI r2, 15
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
