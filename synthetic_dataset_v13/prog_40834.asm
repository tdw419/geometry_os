; DESCRIPTION: Composite: Draws a cyan line from (332, 84) to (197, 18) then Renders a black box of size 18x116 starting at (322, 90).
; PLAN: r0=332(x1), r1=84(y1), r2=197(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=90(y), r7=18(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 84
LDI r2, 197
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 90
LDI r7, 18
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
