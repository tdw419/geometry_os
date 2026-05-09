; DESCRIPTION: Composite: Places a magenta dot at position (63, 74) then Creates a purple rectangular region at (440, 105) spanning 67 by 79 pixels then Places a cyan circle of radius 77 at center (377, 113).
; PLAN: r0=63(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=105(y), r7=67(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=113(y), r12=77(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 105
LDI r7, 67
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 113
LDI r12, 77
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
