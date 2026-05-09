; DESCRIPTION: Composite: Places a cyan line segment connecting (297, 146) to (313, 88) then Renders a cyan box of size 96x40 starting at (254, 103) then Places a black dot at position (278, 144).
; PLAN: r0=297(x1), r1=146(y1), r2=313(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=103(y), r7=96(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 146
LDI r2, 313
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 103
LDI r7, 96
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
