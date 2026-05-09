; DESCRIPTION: Composite: Places a orange 82x60 rectangle at position (293, 4) then Renders a white disk with center (317, 135) and radius 72.
; PLAN: r0=293(x), r1=4(y), r2=82(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=135(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 4
LDI r2, 82
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 135
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
