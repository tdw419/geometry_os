; DESCRIPTION: Composite: Renders a orange box of size 16x59 starting at (436, 120) then Draws a yellow line from (453, 197) to (484, 199) then Places a magenta dot at position (2, 176).
; PLAN: r0=436(x), r1=120(y), r2=16(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=197(y1), r7=484(x2), r8=199(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=176(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 120
LDI r2, 16
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 197
LDI r7, 484
LDI r8, 199
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 176
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
