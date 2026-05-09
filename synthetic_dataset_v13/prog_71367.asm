; DESCRIPTION: Composite: Draws a yellow rectangle at (131, 22) with width 104 and height 89 then Renders a black line between points (242, 209) and (71, 221).
; PLAN: r0=131(x), r1=22(y), r2=104(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x1), r6=209(y1), r7=71(x2), r8=221(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 22
LDI r2, 104
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 209
LDI r7, 71
LDI r8, 221
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
