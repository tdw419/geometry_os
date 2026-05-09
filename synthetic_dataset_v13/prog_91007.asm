; DESCRIPTION: Draws a yellow line from (346, 135) to (225, 225).
; PLAN: r0=346(x1), r1=135(y1), r2=225(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 135
LDI r2, 225
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
