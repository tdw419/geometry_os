; DESCRIPTION: Draws a orange line from (127, 213) to (206, 236).
; PLAN: r0=127(x1), r1=213(y1), r2=206(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 213
LDI r2, 206
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
