; DESCRIPTION: Composite: Creates a magenta rectangular region at (255, 27) spanning 79 by 56 pixels then Places a red line segment connecting (236, 230) to (392, 135).
; PLAN: r0=255(x), r1=27(y), r2=79(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=230(y1), r7=392(x2), r8=135(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 27
LDI r2, 79
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 230
LDI r7, 392
LDI r8, 135
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
