; DESCRIPTION: Draws a blue line from (415, 69) to (213, 221).
; PLAN: r0=415(x1), r1=69(y1), r2=213(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 69
LDI r2, 213
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
