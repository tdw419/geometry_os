; DESCRIPTION: Composite: Creates a orange rectangular region at (247, 132) spanning 118 by 39 pixels then Renders a cyan line between points (1, 47) and (371, 0) then Places a purple dot at position (282, 84).
; PLAN: r0=247(x), r1=132(y), r2=118(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=47(y1), r7=371(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=282(x), r11=84(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 132
LDI r2, 118
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 47
LDI r7, 371
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 84
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
