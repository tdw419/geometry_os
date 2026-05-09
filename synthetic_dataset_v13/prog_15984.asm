; DESCRIPTION: Composite: Draws a black rectangle at (2, 142) with width 12 and height 43 then Draws a cyan line from (474, 107) to (242, 45).
; PLAN: r0=2(x), r1=142(y), r2=12(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=107(y1), r7=242(x2), r8=45(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 142
LDI r2, 12
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 107
LDI r7, 242
LDI r8, 45
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
