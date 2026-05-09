; DESCRIPTION: Composite: Renders a black box of size 115x32 starting at (165, 44) then Renders a orange line between points (144, 116) and (221, 180).
; PLAN: r0=165(x), r1=44(y), r2=115(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=116(y1), r7=221(x2), r8=180(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 44
LDI r2, 115
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 116
LDI r7, 221
LDI r8, 180
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
