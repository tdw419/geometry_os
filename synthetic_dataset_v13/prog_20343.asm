; DESCRIPTION: Composite: Draws a black line from (289, 255) to (197, 99) then Draws a blue rectangle at (50, 146) with width 31 and height 46.
; PLAN: r0=289(x1), r1=255(y1), r2=197(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=146(y), r7=31(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 255
LDI r2, 197
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 146
LDI r7, 31
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
