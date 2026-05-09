; DESCRIPTION: Draws a cyan line from (499, 79) to (84, 113).
; PLAN: r0=499(x1), r1=79(y1), r2=84(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 79
LDI r2, 84
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
