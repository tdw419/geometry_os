; DESCRIPTION: Composite: Places a green circle of radius 64 at center (340, 109) then Places a green 88x86 rectangle at position (226, 64).
; PLAN: r0=340(x), r1=109(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=64(y), r7=88(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 109
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 64
LDI r7, 88
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
