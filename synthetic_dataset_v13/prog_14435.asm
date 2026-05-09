; DESCRIPTION: Draws a blue line from (473, 173) to (317, 192).
; PLAN: r0=473(x1), r1=173(y1), r2=317(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 173
LDI r2, 317
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
