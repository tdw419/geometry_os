; DESCRIPTION: Composite: Places a orange circle of radius 56 at center (410, 162) then Draws a black line from (67, 17) to (502, 131).
; PLAN: r0=410(x), r1=162(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x1), r6=17(y1), r7=502(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 162
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 17
LDI r7, 502
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
