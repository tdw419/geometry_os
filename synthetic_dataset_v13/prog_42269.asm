; DESCRIPTION: Draws a cyan line from (96, 255) to (350, 205).
; PLAN: r0=96(x1), r1=255(y1), r2=350(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 255
LDI r2, 350
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
