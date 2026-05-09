; DESCRIPTION: Composite: Draws a white line from (242, 49) to (494, 163) then Places a yellow 29x85 rectangle at position (17, 56).
; PLAN: r0=242(x1), r1=49(y1), r2=494(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=56(y), r7=29(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 49
LDI r2, 494
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 56
LDI r7, 29
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
