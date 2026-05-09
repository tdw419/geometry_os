; DESCRIPTION: Composite: Places a green dot at position (417, 141) then Places a blue 68x91 rectangle at position (167, 96) then Places a cyan line segment connecting (76, 188) to (68, 103).
; PLAN: r0=417(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=96(y), r7=68(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=188(y1), r12=68(x2), r13=103(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 167
LDI r6, 96
LDI r7, 68
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 188
LDI r12, 68
LDI r13, 103
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
