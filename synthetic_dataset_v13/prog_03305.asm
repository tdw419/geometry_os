; DESCRIPTION: Composite: Places a red circle of radius 22 at center (61, 50) then Draws a yellow rectangle at (99, 47) with width 92 and height 87.
; PLAN: r0=61(x), r1=50(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=47(y), r7=92(width), r8=87(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 50
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 47
LDI r7, 92
LDI r8, 87
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
