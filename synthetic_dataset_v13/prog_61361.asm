; DESCRIPTION: Composite: Draws a magenta rectangle at (42, 42) with width 29 and height 32 then Draws a cyan line from (106, 40) to (334, 31).
; PLAN: r0=42(x), r1=42(y), r2=29(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=40(y1), r7=334(x2), r8=31(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 42
LDI r2, 29
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 40
LDI r7, 334
LDI r8, 31
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
