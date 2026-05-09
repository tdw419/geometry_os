; DESCRIPTION: Composite: Renders a purple disk with center (352, 88) and radius 65 then Places a magenta 96x45 rectangle at position (410, 40) then Sets a single green pixel at (145, 235).
; PLAN: r0=352(x), r1=88(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=40(y), r7=96(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=235(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 88
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 40
LDI r7, 96
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 235
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
