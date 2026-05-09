; DESCRIPTION: Places a yellow line segment connecting (465, 191) to (248, 215).
; PLAN: r0=465(x1), r1=191(y1), r2=248(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 191
LDI r2, 248
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
