; DESCRIPTION: Composite: Places a orange circle of radius 79 at center (418, 168) then Draws a magenta rectangle at (387, 189) with width 61 and height 62.
; PLAN: r0=418(x), r1=168(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=189(y), r7=61(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 168
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 189
LDI r7, 61
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
