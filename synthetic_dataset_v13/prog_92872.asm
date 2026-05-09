; DESCRIPTION: Composite: Places a red 95x92 rectangle at position (100, 93) then Sets a single purple pixel at (190, 54) then Renders a red disk with center (145, 113) and radius 16.
; PLAN: r0=100(x), r1=93(y), r2=95(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=54(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=113(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 93
LDI r2, 95
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 54
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 145
LDI r11, 113
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
