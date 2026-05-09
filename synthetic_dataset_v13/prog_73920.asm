; DESCRIPTION: Composite: Renders a white line between points (165, 132) and (479, 44) then Creates a orange rectangular region at (98, 75) spanning 69 by 28 pixels.
; PLAN: r0=165(x1), r1=132(y1), r2=479(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=75(y), r7=69(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 132
LDI r2, 479
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 75
LDI r7, 69
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
