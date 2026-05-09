; DESCRIPTION: Composite: Places a purple circle of radius 79 at center (328, 96) then Creates a yellow rectangular region at (465, 107) spanning 22 by 104 pixels.
; PLAN: r0=328(x), r1=96(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=107(y), r7=22(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 96
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 107
LDI r7, 22
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
