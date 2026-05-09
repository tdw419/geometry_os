; DESCRIPTION: Composite: Draws a orange line from (239, 18) to (196, 133) then Places a white circle of radius 55 at center (151, 139).
; PLAN: r0=239(x1), r1=18(y1), r2=196(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=139(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 18
LDI r2, 196
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 139
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
