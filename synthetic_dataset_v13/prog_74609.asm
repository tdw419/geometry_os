; DESCRIPTION: Composite: Places a purple dot at position (243, 150) then Renders a magenta line between points (400, 100) and (315, 83) then Renders a orange box of size 14x98 starting at (26, 108).
; PLAN: r0=243(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=100(y1), r7=315(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=108(y), r12=14(width), r13=98(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 100
LDI r7, 315
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 108
LDI r12, 14
LDI r13, 98
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
