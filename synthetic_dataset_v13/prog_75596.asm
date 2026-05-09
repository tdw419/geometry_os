; DESCRIPTION: Composite: Draws a cyan line from (502, 126) to (91, 137) then Draws a white circle centered at (242, 95) with radius 49 then Places a purple 60x14 rectangle at position (177, 205).
; PLAN: r0=502(x1), r1=126(y1), r2=91(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=95(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=205(y), r12=60(width), r13=14(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 126
LDI r2, 91
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 95
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 205
LDI r12, 60
LDI r13, 14
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
