; DESCRIPTION: Composite: Places a orange 55x27 rectangle at position (340, 38) then Creates a yellow circular shape at (465, 212) with radius 32.
; PLAN: r0=340(x), r1=38(y), r2=55(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=212(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 38
LDI r2, 55
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 212
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
