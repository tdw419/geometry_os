; DESCRIPTION: Composite: Places a yellow 59x47 rectangle at position (422, 164) then Creates a white circular shape at (380, 193) with radius 57.
; PLAN: r0=422(x), r1=164(y), r2=59(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=193(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 164
LDI r2, 59
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 193
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
