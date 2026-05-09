; DESCRIPTION: Composite: Creates a purple rectangular region at (147, 176) spanning 48 by 32 pixels then Places a cyan line segment connecting (508, 215) to (21, 75).
; PLAN: r0=147(x), r1=176(y), r2=48(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x1), r6=215(y1), r7=21(x2), r8=75(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 176
LDI r2, 48
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 215
LDI r7, 21
LDI r8, 75
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
