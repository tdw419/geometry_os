; DESCRIPTION: Composite: Places a white dot at position (49, 231) then Renders a white box of size 10x65 starting at (344, 166) then Places a red circle of radius 71 at center (386, 150).
; PLAN: r0=49(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=166(y), r7=10(width), r8=65(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=150(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 166
LDI r7, 10
LDI r8, 65
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 150
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
