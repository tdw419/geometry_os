; DESCRIPTION: Draws a cyan line from (84, 127) to (459, 29).
; PLAN: r0=84(x1), r1=127(y1), r2=459(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 127
LDI r2, 459
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
