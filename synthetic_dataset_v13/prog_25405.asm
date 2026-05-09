; DESCRIPTION: Composite: Places a cyan line segment connecting (117, 7) to (315, 68) then Draws a yellow rectangle at (86, 131) with width 46 and height 64.
; PLAN: r0=117(x1), r1=7(y1), r2=315(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=131(y), r7=46(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 7
LDI r2, 315
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 131
LDI r7, 46
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
