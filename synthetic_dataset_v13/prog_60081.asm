; DESCRIPTION: Composite: Creates a magenta rectangular region at (92, 0) spanning 59 by 115 pixels then Draws a black line from (459, 121) to (156, 50) then Places a magenta dot at position (442, 253).
; PLAN: r0=92(x), r1=0(y), r2=59(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x1), r6=121(y1), r7=156(x2), r8=50(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=253(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 0
LDI r2, 59
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 121
LDI r7, 156
LDI r8, 50
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 253
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
