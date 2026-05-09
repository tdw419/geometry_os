; DESCRIPTION: Places a cyan line segment connecting (260, 194) to (35, 108).
; PLAN: r0=260(x1), r1=194(y1), r2=35(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 194
LDI r2, 35
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
