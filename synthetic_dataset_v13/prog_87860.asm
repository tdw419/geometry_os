; DESCRIPTION: Composite: Places a blue 66x114 rectangle at position (267, 135) then Renders a blue disk with center (79, 112) and radius 76.
; PLAN: r0=267(x), r1=135(y), r2=66(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=112(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 135
LDI r2, 66
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 112
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
