; DESCRIPTION: Composite: Places a blue dot at position (392, 50) then Places a cyan line segment connecting (114, 109) to (216, 93) then Creates a orange rectangular region at (23, 55) spanning 106 by 120 pixels.
; PLAN: r0=392(x), r1=50(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=109(y1), r7=216(x2), r8=93(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=55(y), r12=106(width), r13=120(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 50
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 109
LDI r7, 216
LDI r8, 93
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 55
LDI r12, 106
LDI r13, 120
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
