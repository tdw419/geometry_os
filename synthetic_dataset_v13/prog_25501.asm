; DESCRIPTION: Composite: Renders a purple disk with center (110, 196) and radius 47 then Renders a magenta box of size 93x87 starting at (389, 160) then Sets a single blue pixel at (124, 28).
; PLAN: r0=110(x), r1=196(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=160(y), r7=93(width), r8=87(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=28(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 196
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 160
LDI r7, 93
LDI r8, 87
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 28
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
