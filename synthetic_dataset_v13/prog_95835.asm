; DESCRIPTION: Composite: Places a green circle of radius 11 at center (202, 225) then Creates a purple rectangular region at (184, 111) spanning 117 by 68 pixels.
; PLAN: r0=202(x), r1=225(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=111(y), r7=117(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 225
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 111
LDI r7, 117
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
