; DESCRIPTION: Composite: Places a blue line segment connecting (374, 145) to (380, 152) then Places a magenta circle of radius 65 at center (90, 68).
; PLAN: r0=374(x1), r1=145(y1), r2=380(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=68(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 145
LDI r2, 380
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 68
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
