; DESCRIPTION: Draws a magenta line from (371, 213) to (276, 166).
; PLAN: r0=371(x1), r1=213(y1), r2=276(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 213
LDI r2, 276
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
