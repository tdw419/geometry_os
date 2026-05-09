; DESCRIPTION: Composite: Places a white dot at position (61, 253) then Places a white line segment connecting (405, 184) to (339, 48) then Renders a white box of size 84x58 starting at (75, 167).
; PLAN: r0=61(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=184(y1), r7=339(x2), r8=48(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=167(y), r12=84(width), r13=58(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 184
LDI r7, 339
LDI r8, 48
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 167
LDI r12, 84
LDI r13, 58
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
