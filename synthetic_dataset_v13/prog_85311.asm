; DESCRIPTION: Composite: Places a blue dot at position (408, 5) then Renders a black box of size 22x73 starting at (236, 64) then Draws a cyan line from (378, 112) to (499, 0).
; PLAN: r0=408(x), r1=5(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=64(y), r7=22(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=112(y1), r12=499(x2), r13=0(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 5
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 64
LDI r7, 22
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 112
LDI r12, 499
LDI r13, 0
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
