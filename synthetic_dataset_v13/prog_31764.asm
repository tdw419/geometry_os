; DESCRIPTION: Composite: Draws a blue line from (62, 79) to (103, 104) then Places a red dot at position (92, 99).
; PLAN: r0=62(x1), r1=79(y1), r2=103(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=99(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 79
LDI r2, 103
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 99
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
