; DESCRIPTION: Composite: Sets a single red pixel at (303, 186) then Renders a white box of size 91x25 starting at (173, 178) then Places a cyan line segment connecting (58, 207) to (80, 61).
; PLAN: r0=303(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=178(y), r7=91(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x1), r11=207(y1), r12=80(x2), r13=61(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 178
LDI r7, 91
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 207
LDI r12, 80
LDI r13, 61
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
