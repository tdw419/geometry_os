; DESCRIPTION: Composite: Sets a single orange pixel at (107, 117) then Renders a orange box of size 50x90 starting at (317, 103) then Places a cyan line segment connecting (19, 46) to (104, 189).
; PLAN: r0=107(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=103(y), r7=50(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=19(x1), r11=46(y1), r12=104(x2), r13=189(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 117
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 317
LDI r6, 103
LDI r7, 50
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 46
LDI r12, 104
LDI r13, 189
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
