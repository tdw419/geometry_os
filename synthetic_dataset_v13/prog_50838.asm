; DESCRIPTION: Composite: Draws a orange rectangle at (406, 37) with width 64 and height 81 then Renders a cyan line between points (148, 170) and (212, 224).
; PLAN: r0=406(x), r1=37(y), r2=64(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x1), r6=170(y1), r7=212(x2), r8=224(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 37
LDI r2, 64
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 170
LDI r7, 212
LDI r8, 224
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
