; DESCRIPTION: Composite: Draws a black line from (52, 162) to (39, 125) then Renders a green disk with center (301, 144) and radius 77 then Places a cyan 40x83 rectangle at position (269, 172).
; PLAN: r0=52(x1), r1=162(y1), r2=39(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=144(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x), r11=172(y), r12=40(width), r13=83(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 162
LDI r2, 39
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 144
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 172
LDI r12, 40
LDI r13, 83
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
