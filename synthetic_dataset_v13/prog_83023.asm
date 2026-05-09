; DESCRIPTION: Places a cyan line segment connecting (86, 107) to (291, 197).
; PLAN: r0=86(x1), r1=107(y1), r2=291(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 107
LDI r2, 291
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
