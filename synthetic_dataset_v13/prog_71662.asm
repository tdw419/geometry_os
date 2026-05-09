; DESCRIPTION: Composite: Sets a single white pixel at (290, 188) then Places a magenta line segment connecting (363, 214) to (231, 225) then Renders a cyan box of size 77x92 starting at (96, 27).
; PLAN: r0=290(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=214(y1), r7=231(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=27(y), r12=77(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 214
LDI r7, 231
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 27
LDI r12, 77
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
