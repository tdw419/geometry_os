; DESCRIPTION: Composite: Draws a blue line from (497, 108) to (167, 150) then Renders a orange disk with center (258, 210) and radius 28.
; PLAN: r0=497(x1), r1=108(y1), r2=167(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=210(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 108
LDI r2, 167
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 210
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
