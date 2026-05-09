; DESCRIPTION: Composite: Renders a white box of size 82x32 starting at (47, 14) then Renders a cyan line between points (261, 147) and (284, 53) then Places a magenta dot at position (131, 161).
; PLAN: r0=47(x), r1=14(y), r2=82(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x1), r6=147(y1), r7=284(x2), r8=53(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=161(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 14
LDI r2, 82
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 147
LDI r7, 284
LDI r8, 53
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 161
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
