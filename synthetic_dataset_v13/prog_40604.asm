; DESCRIPTION: Composite: Places a green circle of radius 63 at center (391, 120) then Draws a blue rectangle at (193, 143) with width 30 and height 10.
; PLAN: r0=391(x), r1=120(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=143(y), r7=30(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 120
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 143
LDI r7, 30
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
