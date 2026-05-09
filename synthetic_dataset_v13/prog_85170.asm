; DESCRIPTION: Composite: Places a white 40x77 rectangle at position (457, 26) then Places a blue circle of radius 21 at center (406, 234).
; PLAN: r0=457(x), r1=26(y), r2=40(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=234(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 26
LDI r2, 40
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 234
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
