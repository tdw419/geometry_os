; DESCRIPTION: Composite: Renders a white box of size 56x107 starting at (400, 76) then Draws a cyan line from (209, 95) to (64, 244) then Places a magenta dot at position (95, 154).
; PLAN: r0=400(x), r1=76(y), r2=56(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=95(y1), r7=64(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=154(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 76
LDI r2, 56
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 95
LDI r7, 64
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 154
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
