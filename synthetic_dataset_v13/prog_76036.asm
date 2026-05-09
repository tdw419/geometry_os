; DESCRIPTION: Composite: Draws a magenta rectangle at (405, 96) with width 55 and height 65 then Places a white line segment connecting (404, 107) to (458, 16).
; PLAN: r0=405(x), r1=96(y), r2=55(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x1), r6=107(y1), r7=458(x2), r8=16(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 96
LDI r2, 55
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 107
LDI r7, 458
LDI r8, 16
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
