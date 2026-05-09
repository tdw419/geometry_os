; DESCRIPTION: Places a cyan line segment connecting (412, 177) to (220, 21).
; PLAN: r0=412(x1), r1=177(y1), r2=220(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 177
LDI r2, 220
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
