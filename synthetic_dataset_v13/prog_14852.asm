; DESCRIPTION: Composite: Renders a magenta disk with center (197, 132) and radius 75 then Places a magenta 94x117 rectangle at position (261, 120).
; PLAN: r0=197(x), r1=132(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=120(y), r7=94(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 132
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 120
LDI r7, 94
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
