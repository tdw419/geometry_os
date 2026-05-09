; DESCRIPTION: Composite: Places a orange 93x86 rectangle at position (76, 160) then Renders a yellow disk with center (67, 146) and radius 67.
; PLAN: r0=76(x), r1=160(y), r2=93(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=146(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 160
LDI r2, 93
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 146
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
