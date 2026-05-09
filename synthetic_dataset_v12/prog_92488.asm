; DESCRIPTION: Places a cyan line segment connecting (259, 255) to (304, 198).
; PLAN: r0=259(x1), r1=255(y1), r2=304(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 255
LDI r2, 304
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
