; DESCRIPTION: Draws a yellow line from (396, 74) to (272, 113).
; PLAN: r0=396(x1), r1=74(y1), r2=272(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 74
LDI r2, 272
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
