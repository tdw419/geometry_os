; DESCRIPTION: Composite: Draws a yellow line from (82, 166) to (86, 129) then Draws a magenta rectangle at (271, 39) with width 109 and height 31 then Sets a single white pixel at (486, 72).
; PLAN: r0=82(x1), r1=166(y1), r2=86(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=39(y), r7=109(width), r8=31(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x), r11=72(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 166
LDI r2, 86
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 39
LDI r7, 109
LDI r8, 31
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 72
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
