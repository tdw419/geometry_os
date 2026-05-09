; DESCRIPTION: Composite: Creates a cyan rectangular region at (248, 92) spanning 50 by 87 pixels then Places a green line segment connecting (388, 17) to (5, 27).
; PLAN: r0=248(x), r1=92(y), r2=50(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=17(y1), r7=5(x2), r8=27(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 92
LDI r2, 50
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 17
LDI r7, 5
LDI r8, 27
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
