; DESCRIPTION: Places a cyan line segment connecting (303, 64) to (362, 238).
; PLAN: r0=303(x1), r1=64(y1), r2=362(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 64
LDI r2, 362
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
