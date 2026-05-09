; DESCRIPTION: Composite: Sets a single white pixel at (280, 48) then Renders a orange line between points (450, 20) and (356, 88) then Places a red 114x13 rectangle at position (265, 42).
; PLAN: r0=280(x), r1=48(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=450(x1), r6=20(y1), r7=356(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=42(y), r12=114(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 48
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 20
LDI r7, 356
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 42
LDI r12, 114
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
