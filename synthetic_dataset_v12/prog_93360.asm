; DESCRIPTION: Composite: Places a green dot at position (271, 223) then Creates a blue rectangular region at (7, 37) spanning 54 by 59 pixels then Places a black circle of radius 68 at center (70, 146).
; PLAN: r0=271(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=37(y), r7=54(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=146(y), r12=68(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 7
LDI r6, 37
LDI r7, 54
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 146
LDI r12, 68
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
