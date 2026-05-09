; DESCRIPTION: Composite: Places a cyan dot at position (202, 117) then Draws a cyan line from (5, 141) to (399, 219) then Renders a magenta box of size 87x17 starting at (421, 66).
; PLAN: r0=202(x), r1=117(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=141(y1), r7=399(x2), r8=219(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=66(y), r12=87(width), r13=17(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 117
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 5
LDI r6, 141
LDI r7, 399
LDI r8, 219
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 66
LDI r12, 87
LDI r13, 17
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
