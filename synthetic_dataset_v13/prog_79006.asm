; DESCRIPTION: Places a cyan line segment connecting (492, 143) to (32, 255).
; PLAN: r0=492(x1), r1=143(y1), r2=32(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 143
LDI r2, 32
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
