; DESCRIPTION: Draws a blue line from (410, 230) to (92, 26).
; PLAN: r0=410(x1), r1=230(y1), r2=92(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 230
LDI r2, 92
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
