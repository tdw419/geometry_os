; DESCRIPTION: Draws a cyan line from (54, 43) to (255, 56).
; PLAN: r0=54(x1), r1=43(y1), r2=255(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 43
LDI r2, 255
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
