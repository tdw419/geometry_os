; DESCRIPTION: Composite: Draws a magenta rectangle at (200, 25) with width 76 and height 37 then Renders a orange line between points (305, 165) and (321, 221) then Places a magenta dot at position (45, 6).
; PLAN: r0=200(x), r1=25(y), r2=76(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x1), r6=165(y1), r7=321(x2), r8=221(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=6(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 25
LDI r2, 76
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 165
LDI r7, 321
LDI r8, 221
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 6
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
