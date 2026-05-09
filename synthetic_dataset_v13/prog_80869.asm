; DESCRIPTION: Composite: Draws a red rectangle at (300, 29) with width 60 and height 97 then Sets a single black pixel at (90, 130) then Draws a yellow line from (125, 93) to (374, 190).
; PLAN: r0=300(x), r1=29(y), r2=60(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=125(x1), r11=93(y1), r12=374(x2), r13=190(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 29
LDI r2, 60
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 125
LDI r11, 93
LDI r12, 374
LDI r13, 190
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
