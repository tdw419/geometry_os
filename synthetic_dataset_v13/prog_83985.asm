; DESCRIPTION: Composite: Places a magenta 113x11 rectangle at position (284, 123) then Places a magenta line segment connecting (340, 124) to (46, 210) then Sets a single blue pixel at (168, 66).
; PLAN: r0=284(x), r1=123(y), r2=113(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=124(y1), r7=46(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=66(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 123
LDI r2, 113
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 124
LDI r7, 46
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 66
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
