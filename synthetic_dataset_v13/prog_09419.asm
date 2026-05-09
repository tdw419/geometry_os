; DESCRIPTION: Places a blue line segment connecting (295, 98) to (96, 128).
; PLAN: r0=295(x1), r1=98(y1), r2=96(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 98
LDI r2, 96
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
