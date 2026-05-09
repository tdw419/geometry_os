; DESCRIPTION: Composite: Places a orange 105x74 rectangle at position (322, 82) then Places a cyan line segment connecting (288, 174) to (156, 135).
; PLAN: r0=322(x), r1=82(y), r2=105(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x1), r6=174(y1), r7=156(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 82
LDI r2, 105
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 174
LDI r7, 156
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
