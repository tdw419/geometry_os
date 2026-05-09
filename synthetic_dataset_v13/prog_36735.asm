; DESCRIPTION: Composite: Creates a cyan circular shape at (409, 67) with radius 47 then Creates a magenta rectangular region at (328, 92) spanning 103 by 42 pixels.
; PLAN: r0=409(x), r1=67(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=92(y), r7=103(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 67
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 92
LDI r7, 103
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
