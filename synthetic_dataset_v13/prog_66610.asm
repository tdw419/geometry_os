; DESCRIPTION: Composite: Creates a orange circular shape at (80, 133) with radius 44 then Places a magenta 56x117 rectangle at position (403, 25) then Places a white dot at position (455, 162).
; PLAN: r0=80(x), r1=133(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=25(y), r7=56(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=162(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 133
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 25
LDI r7, 56
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 162
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
