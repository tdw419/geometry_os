; DESCRIPTION: Composite: Renders a green disk with center (356, 218) and radius 31 then Places a magenta 88x27 rectangle at position (52, 117).
; PLAN: r0=356(x), r1=218(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=117(y), r7=88(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 218
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 117
LDI r7, 88
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
