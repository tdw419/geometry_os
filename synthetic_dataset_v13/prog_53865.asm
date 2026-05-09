; DESCRIPTION: Composite: Creates a white circular shape at (240, 38) with radius 22 then Places a green 54x11 rectangle at position (3, 215).
; PLAN: r0=240(x), r1=38(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=215(y), r7=54(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 38
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 215
LDI r7, 54
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
