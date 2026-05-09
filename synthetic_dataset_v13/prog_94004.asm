; DESCRIPTION: Draws a yellow line from (489, 209) to (307, 27).
; PLAN: r0=489(x1), r1=209(y1), r2=307(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 209
LDI r2, 307
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
