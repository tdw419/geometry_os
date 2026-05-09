; DESCRIPTION: Composite: Places a yellow circle of radius 30 at center (54, 59) then Places a green 102x38 rectangle at position (265, 13).
; PLAN: r0=54(x), r1=59(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=13(y), r7=102(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 59
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 13
LDI r7, 102
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
