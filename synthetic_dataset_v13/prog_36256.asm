; DESCRIPTION: Composite: Creates a red circular shape at (416, 135) with radius 26 then Renders a cyan box of size 108x21 starting at (85, 225).
; PLAN: r0=416(x), r1=135(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=225(y), r7=108(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 135
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 225
LDI r7, 108
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
