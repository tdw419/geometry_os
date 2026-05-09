; DESCRIPTION: Draws a blue line from (494, 104) to (502, 59).
; PLAN: r0=494(x1), r1=104(y1), r2=502(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 104
LDI r2, 502
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
