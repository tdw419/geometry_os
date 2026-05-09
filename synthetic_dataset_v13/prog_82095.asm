; DESCRIPTION: Places a cyan line segment connecting (278, 186) to (237, 65).
; PLAN: r0=278(x1), r1=186(y1), r2=237(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 186
LDI r2, 237
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
