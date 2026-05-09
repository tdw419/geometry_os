; DESCRIPTION: Composite: Creates a cyan circular shape at (206, 71) with radius 47 then Places a magenta line segment connecting (346, 46) to (253, 171) then Renders a magenta box of size 69x78 starting at (20, 44).
; PLAN: r0=206(x), r1=71(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=46(y1), r7=253(x2), r8=171(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=20(x), r11=44(y), r12=69(width), r13=78(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 71
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 46
LDI r7, 253
LDI r8, 171
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 44
LDI r12, 69
LDI r13, 78
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
