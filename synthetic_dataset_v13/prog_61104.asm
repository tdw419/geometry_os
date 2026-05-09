; DESCRIPTION: Composite: Places a magenta 26x44 rectangle at position (434, 117) then Draws a blue line from (380, 241) to (73, 153) then Renders a cyan disk with center (386, 83) and radius 44.
; PLAN: r0=434(x), r1=117(y), r2=26(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=241(y1), r7=73(x2), r8=153(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=83(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 117
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 241
LDI r7, 73
LDI r8, 153
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 83
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
