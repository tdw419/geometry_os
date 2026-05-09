; DESCRIPTION: Composite: Renders a magenta box of size 16x29 starting at (346, 141) then Draws a red line from (370, 244) to (309, 228) then Sets a single red pixel at (474, 159).
; PLAN: r0=346(x), r1=141(y), r2=16(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=244(y1), r7=309(x2), r8=228(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=474(x), r11=159(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 141
LDI r2, 16
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 244
LDI r7, 309
LDI r8, 228
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 159
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
