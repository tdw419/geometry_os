; DESCRIPTION: Composite: Places a red line segment connecting (99, 86) to (288, 156) then Places a black 55x23 rectangle at position (284, 30).
; PLAN: r0=99(x1), r1=86(y1), r2=288(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=30(y), r7=55(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 86
LDI r2, 288
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 30
LDI r7, 55
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
