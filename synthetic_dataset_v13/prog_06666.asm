; DESCRIPTION: Composite: Renders a red box of size 111x30 starting at (276, 190) then Places a magenta dot at position (270, 107) then Places a yellow line segment connecting (263, 247) to (49, 48).
; PLAN: r0=276(x), r1=190(y), r2=111(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=107(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=263(x1), r11=247(y1), r12=49(x2), r13=48(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 190
LDI r2, 111
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 107
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 263
LDI r11, 247
LDI r12, 49
LDI r13, 48
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
