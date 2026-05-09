; DESCRIPTION: Composite: Places a red 48x112 rectangle at position (198, 2) then Places a green circle of radius 52 at center (422, 185).
; PLAN: r0=198(x), r1=2(y), r2=48(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=185(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 2
LDI r2, 48
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 185
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
