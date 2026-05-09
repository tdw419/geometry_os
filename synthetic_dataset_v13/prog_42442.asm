; DESCRIPTION: Composite: Places a yellow circle of radius 18 at center (134, 184) then Places a magenta 65x51 rectangle at position (237, 113).
; PLAN: r0=134(x), r1=184(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=113(y), r7=65(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 184
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 113
LDI r7, 65
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
