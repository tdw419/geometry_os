; DESCRIPTION: Places a cyan line segment connecting (138, 203) to (114, 231).
; PLAN: r0=138(x1), r1=203(y1), r2=114(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 203
LDI r2, 114
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
