; DESCRIPTION: Composite: Creates a purple circular shape at (305, 117) with radius 50 then Renders a cyan box of size 78x103 starting at (53, 143).
; PLAN: r0=305(x), r1=117(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=143(y), r7=78(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 117
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 143
LDI r7, 78
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
