; DESCRIPTION: Draws a blue line from (274, 239) to (460, 255).
; PLAN: r0=274(x1), r1=239(y1), r2=460(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 239
LDI r2, 460
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
