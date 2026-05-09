; DESCRIPTION: Composite: Draws a magenta line from (358, 83) to (305, 55) then Renders a magenta box of size 42x19 starting at (351, 194) then Sets a single cyan pixel at (282, 222).
; PLAN: r0=358(x1), r1=83(y1), r2=305(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=194(y), r7=42(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=222(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 83
LDI r2, 305
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 194
LDI r7, 42
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 222
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
