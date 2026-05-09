; DESCRIPTION: Composite: Places a cyan dot at position (392, 127) then Places a green line segment connecting (21, 85) to (225, 177) then Places a blue 16x20 rectangle at position (457, 196).
; PLAN: r0=392(x), r1=127(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=85(y1), r7=225(x2), r8=177(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=196(y), r12=16(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 127
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 85
LDI r7, 225
LDI r8, 177
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 196
LDI r12, 16
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
