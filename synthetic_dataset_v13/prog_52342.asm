; DESCRIPTION: Composite: Draws a blue line from (45, 97) to (412, 249) then Places a white dot at position (92, 60).
; PLAN: r0=45(x1), r1=97(y1), r2=412(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=60(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 97
LDI r2, 412
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 60
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
