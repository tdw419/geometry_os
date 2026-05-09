; DESCRIPTION: Composite: Places a blue line segment connecting (28, 35) to (403, 121) then Places a green dot at position (105, 169).
; PLAN: r0=28(x1), r1=35(y1), r2=403(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 35
LDI r2, 403
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
