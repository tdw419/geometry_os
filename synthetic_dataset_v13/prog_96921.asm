; DESCRIPTION: Places a cyan line segment connecting (108, 97) to (255, 108).
; PLAN: r0=108(x1), r1=97(y1), r2=255(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 97
LDI r2, 255
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
