; DESCRIPTION: Composite: Draws a white line from (108, 177) to (50, 33) then Places a white circle of radius 13 at center (448, 30).
; PLAN: r0=108(x1), r1=177(y1), r2=50(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=30(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 177
LDI r2, 50
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 30
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
