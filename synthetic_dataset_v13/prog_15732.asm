; DESCRIPTION: Composite: Creates a orange rectangular region at (370, 19) spanning 11 by 78 pixels then Places a cyan line segment connecting (17, 163) to (242, 163).
; PLAN: r0=370(x), r1=19(y), r2=11(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x1), r6=163(y1), r7=242(x2), r8=163(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 19
LDI r2, 11
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 163
LDI r7, 242
LDI r8, 163
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
