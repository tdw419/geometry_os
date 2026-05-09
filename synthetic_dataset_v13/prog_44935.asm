; DESCRIPTION: Composite: Draws a red line from (473, 212) to (356, 82) then Places a green circle of radius 31 at center (410, 172).
; PLAN: r0=473(x1), r1=212(y1), r2=356(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=172(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 212
LDI r2, 356
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 172
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
