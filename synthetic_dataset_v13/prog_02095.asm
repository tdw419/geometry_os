; DESCRIPTION: Draws a cyan line from (270, 116) to (474, 23).
; PLAN: r0=270(x1), r1=116(y1), r2=474(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 116
LDI r2, 474
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
