; DESCRIPTION: Composite: Places a blue 33x51 rectangle at position (17, 45) then Places a magenta circle of radius 79 at center (267, 123).
; PLAN: r0=17(x), r1=45(y), r2=33(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=123(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 45
LDI r2, 33
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 123
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
