; DESCRIPTION: Composite: Places a yellow line segment connecting (412, 104) to (255, 120) then Places a yellow dot at position (473, 180).
; PLAN: r0=412(x1), r1=104(y1), r2=255(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=180(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 104
LDI r2, 255
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 180
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
