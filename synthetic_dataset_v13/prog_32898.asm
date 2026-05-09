; DESCRIPTION: Composite: Renders a orange box of size 58x101 starting at (144, 72) then Places a blue dot at position (307, 209) then Places a cyan line segment connecting (256, 155) to (418, 177).
; PLAN: r0=144(x), r1=72(y), r2=58(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=209(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=256(x1), r11=155(y1), r12=418(x2), r13=177(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 72
LDI r2, 58
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 209
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 256
LDI r11, 155
LDI r12, 418
LDI r13, 177
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
