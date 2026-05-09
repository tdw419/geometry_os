; DESCRIPTION: Composite: Places a yellow 74x79 rectangle at position (286, 65) then Places a purple circle of radius 16 at center (267, 161).
; PLAN: r0=286(x), r1=65(y), r2=74(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=161(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 65
LDI r2, 74
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 161
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
