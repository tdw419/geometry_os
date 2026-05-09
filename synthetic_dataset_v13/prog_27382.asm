; DESCRIPTION: Composite: Creates a red rectangular region at (284, 75) spanning 71 by 93 pixels then Places a magenta line segment connecting (370, 71) to (152, 151).
; PLAN: r0=284(x), r1=75(y), r2=71(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=71(y1), r7=152(x2), r8=151(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 75
LDI r2, 71
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 71
LDI r7, 152
LDI r8, 151
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
