; DESCRIPTION: Composite: Places a white 103x30 rectangle at position (307, 166) then Places a blue line segment connecting (307, 55) to (16, 119) then Sets a single green pixel at (184, 210).
; PLAN: r0=307(x), r1=166(y), r2=103(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=55(y1), r7=16(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=210(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 166
LDI r2, 103
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 55
LDI r7, 16
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 210
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
