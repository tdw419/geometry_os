; DESCRIPTION: Composite: Places a blue line segment connecting (421, 84) to (5, 193) then Places a cyan 103x15 rectangle at position (274, 186) then Places a magenta dot at position (370, 233).
; PLAN: r0=421(x1), r1=84(y1), r2=5(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=186(y), r7=103(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 84
LDI r2, 5
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 186
LDI r7, 103
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
