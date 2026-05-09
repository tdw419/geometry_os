; DESCRIPTION: Composite: Draws a cyan line from (37, 148) to (162, 116) then Renders a blue disk with center (150, 55) and radius 43.
; PLAN: r0=37(x1), r1=148(y1), r2=162(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=55(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 148
LDI r2, 162
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 55
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
