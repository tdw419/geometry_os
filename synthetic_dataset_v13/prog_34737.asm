; DESCRIPTION: Composite: Draws a red line from (299, 90) to (367, 55) then Renders a white disk with center (421, 70) and radius 59.
; PLAN: r0=299(x1), r1=90(y1), r2=367(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=70(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 90
LDI r2, 367
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 70
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
