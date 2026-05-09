; DESCRIPTION: Composite: Creates a cyan rectangular region at (307, 119) spanning 74 by 58 pixels then Draws a blue line from (137, 20) to (482, 103).
; PLAN: r0=307(x), r1=119(y), r2=74(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=20(y1), r7=482(x2), r8=103(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 119
LDI r2, 74
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 20
LDI r7, 482
LDI r8, 103
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
