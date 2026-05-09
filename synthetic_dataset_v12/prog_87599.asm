; DESCRIPTION: Composite: Creates a purple rectangular region at (262, 67) spanning 79 by 77 pixels then Draws a green line from (178, 239) to (70, 203).
; PLAN: r0=262(x), r1=67(y), r2=79(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x1), r6=239(y1), r7=70(x2), r8=203(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 67
LDI r2, 79
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 239
LDI r7, 70
LDI r8, 203
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
