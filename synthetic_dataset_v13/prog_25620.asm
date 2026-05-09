; DESCRIPTION: Composite: Places a red circle of radius 42 at center (117, 132) then Creates a magenta rectangular region at (352, 205) spanning 69 by 40 pixels.
; PLAN: r0=117(x), r1=132(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=205(y), r7=69(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 132
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 205
LDI r7, 69
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
