; DESCRIPTION: Composite: Places a blue dot at position (263, 41) then Draws a yellow line from (43, 126) to (67, 39) then Creates a purple rectangular region at (228, 79) spanning 59 by 40 pixels.
; PLAN: r0=263(x), r1=41(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=126(y1), r7=67(x2), r8=39(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=79(y), r12=59(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 41
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 126
LDI r7, 67
LDI r8, 39
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 79
LDI r12, 59
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
