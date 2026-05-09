; DESCRIPTION: Composite: Sets a single purple pixel at (230, 50) then Renders a blue disk with center (96, 179) and radius 73 then Creates a white rectangular region at (279, 38) spanning 103 by 16 pixels.
; PLAN: r0=230(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=179(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=38(y), r12=103(width), r13=16(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 179
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 38
LDI r12, 103
LDI r13, 16
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
