; DESCRIPTION: Draws a green line from (82, 111) to (256, 175).
; PLAN: r0=82(x1), r1=111(y1), r2=256(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 111
LDI r2, 256
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
