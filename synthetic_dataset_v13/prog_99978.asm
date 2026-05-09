; DESCRIPTION: Composite: Creates a magenta rectangular region at (204, 42) spanning 60 by 82 pixels then Places a yellow line segment connecting (455, 129) to (57, 160) then Sets a single orange pixel at (169, 202).
; PLAN: r0=204(x), r1=42(y), r2=60(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x1), r6=129(y1), r7=57(x2), r8=160(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=202(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 42
LDI r2, 60
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 129
LDI r7, 57
LDI r8, 160
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 202
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
