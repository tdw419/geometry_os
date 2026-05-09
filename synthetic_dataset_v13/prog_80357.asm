; DESCRIPTION: Draws a white line from (307, 153) to (55, 213).
; PLAN: r0=307(x1), r1=153(y1), r2=55(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 153
LDI r2, 55
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
