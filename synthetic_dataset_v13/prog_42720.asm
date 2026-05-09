; DESCRIPTION: Composite: Places a magenta line segment connecting (362, 164) to (212, 62) then Draws a orange rectangle at (98, 57) with width 58 and height 64 then Places a red dot at position (72, 91).
; PLAN: r0=362(x1), r1=164(y1), r2=212(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=57(y), r7=58(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 164
LDI r2, 212
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 57
LDI r7, 58
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
