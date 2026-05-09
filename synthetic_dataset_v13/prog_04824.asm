; DESCRIPTION: Composite: Creates a cyan rectangular region at (390, 104) spanning 61 by 63 pixels then Places a magenta line segment connecting (281, 209) to (19, 15).
; PLAN: r0=390(x), r1=104(y), r2=61(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=209(y1), r7=19(x2), r8=15(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 104
LDI r2, 61
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 209
LDI r7, 19
LDI r8, 15
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
