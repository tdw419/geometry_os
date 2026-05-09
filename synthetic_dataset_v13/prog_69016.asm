; DESCRIPTION: Composite: Places a orange line segment connecting (148, 147) to (50, 221) then Creates a cyan rectangular region at (107, 191) spanning 108 by 57 pixels.
; PLAN: r0=148(x1), r1=147(y1), r2=50(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=191(y), r7=108(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 147
LDI r2, 50
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 191
LDI r7, 108
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
