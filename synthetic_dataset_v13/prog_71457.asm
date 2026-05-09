; DESCRIPTION: Composite: Places a orange 86x65 rectangle at position (369, 168) then Creates a cyan circular shape at (139, 68) with radius 59.
; PLAN: r0=369(x), r1=168(y), r2=86(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=68(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 168
LDI r2, 86
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 68
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
