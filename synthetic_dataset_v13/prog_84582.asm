; DESCRIPTION: Composite: Places a orange 36x109 rectangle at position (422, 70) then Renders a blue disk with center (303, 37) and radius 36.
; PLAN: r0=422(x), r1=70(y), r2=36(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=37(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 70
LDI r2, 36
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 37
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
