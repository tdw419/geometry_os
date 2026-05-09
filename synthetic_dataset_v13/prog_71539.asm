; DESCRIPTION: Composite: Creates a yellow rectangular region at (111, 11) spanning 101 by 64 pixels then Places a cyan line segment connecting (364, 12) to (295, 216).
; PLAN: r0=111(x), r1=11(y), r2=101(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=12(y1), r7=295(x2), r8=216(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 11
LDI r2, 101
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 12
LDI r7, 295
LDI r8, 216
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
