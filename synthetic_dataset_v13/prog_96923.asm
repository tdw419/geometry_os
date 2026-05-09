; DESCRIPTION: Composite: Creates a yellow circular shape at (360, 152) with radius 30 then Renders a cyan box of size 120x117 starting at (82, 102).
; PLAN: r0=360(x), r1=152(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=102(y), r7=120(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 152
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 102
LDI r7, 120
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
