; DESCRIPTION: Places a black line segment connecting (392, 226) to (304, 222).
; PLAN: r0=392(x1), r1=226(y1), r2=304(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 226
LDI r2, 304
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
