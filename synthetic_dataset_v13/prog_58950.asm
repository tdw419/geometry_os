; DESCRIPTION: Places a cyan line segment connecting (138, 114) to (197, 203).
; PLAN: r0=138(x1), r1=114(y1), r2=197(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 114
LDI r2, 197
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
