; DESCRIPTION: Composite: Draws a white line from (319, 54) to (175, 68) then Renders a black box of size 107x81 starting at (374, 174).
; PLAN: r0=319(x1), r1=54(y1), r2=175(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=174(y), r7=107(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 54
LDI r2, 175
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 174
LDI r7, 107
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
