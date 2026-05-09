; DESCRIPTION: Composite: Renders a orange box of size 111x95 starting at (154, 86) then Draws a magenta line from (499, 126) to (92, 4) then Sets a single white pixel at (342, 255).
; PLAN: r0=154(x), r1=86(y), r2=111(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=499(x1), r6=126(y1), r7=92(x2), r8=4(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=255(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 86
LDI r2, 111
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 126
LDI r7, 92
LDI r8, 4
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 255
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
