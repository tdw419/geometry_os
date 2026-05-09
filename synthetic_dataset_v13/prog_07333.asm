; DESCRIPTION: Draws a green line from (175, 69) to (82, 115).
; PLAN: r0=175(x1), r1=69(y1), r2=82(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 69
LDI r2, 82
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
