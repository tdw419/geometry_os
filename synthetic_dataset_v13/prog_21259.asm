; DESCRIPTION: Composite: Sets a single cyan pixel at (434, 103) then Draws a green rectangle at (46, 141) with width 74 and height 62 then Places a red line segment connecting (346, 42) to (420, 40).
; PLAN: r0=434(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=141(y), r7=74(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=42(y1), r12=420(x2), r13=40(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 141
LDI r7, 74
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 42
LDI r12, 420
LDI r13, 40
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
