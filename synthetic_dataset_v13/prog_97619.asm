; DESCRIPTION: Composite: Places a green dot at position (60, 8) then Draws a red line from (455, 129) to (384, 38) then Draws a purple rectangle at (294, 35) with width 59 and height 95.
; PLAN: r0=60(x), r1=8(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=455(x1), r6=129(y1), r7=384(x2), r8=38(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=35(y), r12=59(width), r13=95(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 8
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 455
LDI r6, 129
LDI r7, 384
LDI r8, 38
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 35
LDI r12, 59
LDI r13, 95
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
