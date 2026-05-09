; DESCRIPTION: Composite: Draws a blue line from (100, 59) to (436, 54) then Places a blue dot at position (198, 80).
; PLAN: r0=100(x1), r1=59(y1), r2=436(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=80(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 59
LDI r2, 436
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 80
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
