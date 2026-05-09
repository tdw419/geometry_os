; DESCRIPTION: Composite: Draws a white line from (222, 82) to (239, 28) then Places a white 85x48 rectangle at position (227, 18) then Sets a single cyan pixel at (260, 42).
; PLAN: r0=222(x1), r1=82(y1), r2=239(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=18(y), r7=85(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=42(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 82
LDI r2, 239
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 18
LDI r7, 85
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 42
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
