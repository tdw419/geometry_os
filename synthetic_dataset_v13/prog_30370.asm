; DESCRIPTION: Composite: Places a red line segment connecting (224, 127) to (153, 224) then Places a yellow 43x51 rectangle at position (405, 31).
; PLAN: r0=224(x1), r1=127(y1), r2=153(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=31(y), r7=43(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 127
LDI r2, 153
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 31
LDI r7, 43
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
