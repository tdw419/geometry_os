; DESCRIPTION: Composite: Draws a blue line from (54, 192) to (173, 118) then Places a red dot at position (380, 61).
; PLAN: r0=54(x1), r1=192(y1), r2=173(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=61(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 192
LDI r2, 173
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 61
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
