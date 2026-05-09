; DESCRIPTION: Composite: Draws a green line from (210, 243) to (42, 156) then Draws a red rectangle at (129, 154) with width 13 and height 74.
; PLAN: r0=210(x1), r1=243(y1), r2=42(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=154(y), r7=13(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 243
LDI r2, 42
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 154
LDI r7, 13
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
