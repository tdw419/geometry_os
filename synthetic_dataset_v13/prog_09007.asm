; DESCRIPTION: Composite: Places a magenta dot at position (25, 224) then Draws a white rectangle at (202, 122) with width 44 and height 59 then Draws a black line from (508, 242) to (11, 247).
; PLAN: r0=25(x), r1=224(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=122(y), r7=44(width), r8=59(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=508(x1), r11=242(y1), r12=11(x2), r13=247(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 224
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 122
LDI r7, 44
LDI r8, 59
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 242
LDI r12, 11
LDI r13, 247
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
