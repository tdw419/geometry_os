; DESCRIPTION: Composite: Places a magenta dot at position (154, 60) then Places a yellow line segment connecting (201, 16) to (271, 247) then Creates a yellow rectangular region at (25, 69) spanning 47 by 111 pixels.
; PLAN: r0=154(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=16(y1), r7=271(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=69(y), r12=47(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 16
LDI r7, 271
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 69
LDI r12, 47
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
