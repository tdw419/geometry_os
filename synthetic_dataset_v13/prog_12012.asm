; DESCRIPTION: Draws a blue line from (462, 239) to (398, 143).
; PLAN: r0=462(x1), r1=239(y1), r2=398(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 239
LDI r2, 398
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
