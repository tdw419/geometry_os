; DESCRIPTION: Composite: Places a orange circle of radius 65 at center (440, 151) then Renders a white box of size 94x109 starting at (349, 65).
; PLAN: r0=440(x), r1=151(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=65(y), r7=94(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 151
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 65
LDI r7, 94
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
