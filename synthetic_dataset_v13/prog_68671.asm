; DESCRIPTION: Composite: Places a blue line segment connecting (372, 186) to (474, 179) then Places a orange 92x99 rectangle at position (304, 37).
; PLAN: r0=372(x1), r1=186(y1), r2=474(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=37(y), r7=92(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 186
LDI r2, 474
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 37
LDI r7, 92
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
