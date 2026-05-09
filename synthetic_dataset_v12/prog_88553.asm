; DESCRIPTION: Composite: Places a blue dot at position (55, 208) then Draws a orange line from (313, 71) to (222, 228) then Places a cyan 64x11 rectangle at position (161, 11).
; PLAN: r0=55(x), r1=208(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=313(x1), r6=71(y1), r7=222(x2), r8=228(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=11(y), r12=64(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 208
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 71
LDI r7, 222
LDI r8, 228
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 11
LDI r12, 64
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
