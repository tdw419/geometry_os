; DESCRIPTION: Composite: Places a white dot at position (160, 166) then Renders a red line between points (36, 195) and (22, 50) then Places a red 61x64 rectangle at position (137, 139).
; PLAN: r0=160(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=36(x1), r6=195(y1), r7=22(x2), r8=50(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=139(y), r12=61(width), r13=64(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 195
LDI r7, 22
LDI r8, 50
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 139
LDI r12, 61
LDI r13, 64
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
