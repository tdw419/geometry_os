; DESCRIPTION: Draws a cyan line from (385, 247) to (350, 113).
; PLAN: r0=385(x1), r1=247(y1), r2=350(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 247
LDI r2, 350
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
