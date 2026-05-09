; DESCRIPTION: Places a cyan line segment connecting (197, 223) to (144, 22).
; PLAN: r0=197(x1), r1=223(y1), r2=144(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 223
LDI r2, 144
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
