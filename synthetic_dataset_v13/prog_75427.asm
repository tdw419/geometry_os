; DESCRIPTION: Draws a cyan line from (431, 248) to (267, 116).
; PLAN: r0=431(x1), r1=248(y1), r2=267(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 248
LDI r2, 267
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
