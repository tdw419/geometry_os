; DESCRIPTION: Composite: Draws a blue line from (383, 42) to (87, 56) then Renders a white disk with center (59, 117) and radius 59.
; PLAN: r0=383(x1), r1=42(y1), r2=87(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=117(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 42
LDI r2, 87
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 117
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
