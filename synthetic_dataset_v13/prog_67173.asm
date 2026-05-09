; DESCRIPTION: Composite: Draws a cyan rectangle at (182, 177) with width 51 and height 68 then Places a red dot at position (386, 65) then Places a magenta line segment connecting (307, 222) to (27, 145).
; PLAN: r0=182(x), r1=177(y), r2=51(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=65(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=307(x1), r11=222(y1), r12=27(x2), r13=145(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 177
LDI r2, 51
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 65
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 307
LDI r11, 222
LDI r12, 27
LDI r13, 145
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
