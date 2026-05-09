; DESCRIPTION: Composite: Sets a single green pixel at (479, 164) then Draws a magenta line from (464, 176) to (192, 251) then Renders a cyan box of size 54x110 starting at (24, 81).
; PLAN: r0=479(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=176(y1), r7=192(x2), r8=251(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=81(y), r12=54(width), r13=110(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 464
LDI r6, 176
LDI r7, 192
LDI r8, 251
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 81
LDI r12, 54
LDI r13, 110
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
