; DESCRIPTION: Composite: Places a magenta dot at position (497, 238) then Places a green line segment connecting (150, 66) to (466, 69) then Creates a green rectangular region at (80, 103) spanning 40 by 47 pixels.
; PLAN: r0=497(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=66(y1), r7=466(x2), r8=69(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=103(y), r12=40(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 66
LDI r7, 466
LDI r8, 69
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 103
LDI r12, 40
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
