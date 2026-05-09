; DESCRIPTION: Composite: Draws a cyan line from (316, 103) to (42, 110) then Places a white dot at position (154, 188) then Renders a black box of size 19x112 starting at (284, 121).
; PLAN: r0=316(x1), r1=103(y1), r2=42(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=188(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=121(y), r12=19(width), r13=112(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 103
LDI r2, 42
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 188
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 121
LDI r12, 19
LDI r13, 112
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
