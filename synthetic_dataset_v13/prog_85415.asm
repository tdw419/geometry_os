; DESCRIPTION: Composite: Sets a single purple pixel at (225, 118) then Places a yellow 48x77 rectangle at position (463, 3) then Places a cyan line segment connecting (294, 128) to (224, 2).
; PLAN: r0=225(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=3(y), r7=48(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x1), r11=128(y1), r12=224(x2), r13=2(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 3
LDI r7, 48
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 128
LDI r12, 224
LDI r13, 2
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
