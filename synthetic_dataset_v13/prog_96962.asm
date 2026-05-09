; DESCRIPTION: Composite: Renders a orange disk with center (236, 160) and radius 42 then Places a orange 116x11 rectangle at position (141, 111) then Sets a single magenta pixel at (456, 119).
; PLAN: r0=236(x), r1=160(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=111(y), r7=116(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x), r11=119(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 160
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 111
LDI r7, 116
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 119
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
