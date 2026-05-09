; DESCRIPTION: Composite: Renders a blue line between points (83, 116) and (194, 223) then Places a orange 83x91 rectangle at position (59, 23).
; PLAN: r0=83(x1), r1=116(y1), r2=194(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=23(y), r7=83(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 116
LDI r2, 194
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 23
LDI r7, 83
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
