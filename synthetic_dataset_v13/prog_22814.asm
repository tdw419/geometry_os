; DESCRIPTION: Composite: Creates a cyan rectangular region at (259, 57) spanning 49 by 79 pixels then Places a green line segment connecting (271, 230) to (246, 151).
; PLAN: r0=259(x), r1=57(y), r2=49(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=230(y1), r7=246(x2), r8=151(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 57
LDI r2, 49
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 230
LDI r7, 246
LDI r8, 151
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
