; DESCRIPTION: Composite: Draws a blue rectangle at (304, 92) with width 38 and height 58 then Draws a blue line from (52, 168) to (248, 135).
; PLAN: r0=304(x), r1=92(y), r2=38(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x1), r6=168(y1), r7=248(x2), r8=135(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 92
LDI r2, 38
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 168
LDI r7, 248
LDI r8, 135
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
