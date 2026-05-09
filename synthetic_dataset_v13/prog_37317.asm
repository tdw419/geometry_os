; DESCRIPTION: Places a cyan line segment connecting (113, 97) to (320, 234).
; PLAN: r0=113(x1), r1=97(y1), r2=320(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 97
LDI r2, 320
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
