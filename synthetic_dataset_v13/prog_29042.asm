; DESCRIPTION: Composite: Places a black 108x83 rectangle at position (154, 44) then Places a yellow line segment connecting (495, 195) to (322, 0).
; PLAN: r0=154(x), r1=44(y), r2=108(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=195(y1), r7=322(x2), r8=0(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 44
LDI r2, 108
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 195
LDI r7, 322
LDI r8, 0
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
