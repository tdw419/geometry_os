; DESCRIPTION: Composite: Sets a single blue pixel at (270, 93) then Creates a cyan circular shape at (99, 80) with radius 80 then Places a green 59x32 rectangle at position (433, 126).
; PLAN: r0=270(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=80(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=126(y), r12=59(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 80
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 126
LDI r12, 59
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
