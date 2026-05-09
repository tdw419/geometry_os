; DESCRIPTION: Places a cyan line segment connecting (347, 191) to (440, 113).
; PLAN: r0=347(x1), r1=191(y1), r2=440(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 191
LDI r2, 440
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
