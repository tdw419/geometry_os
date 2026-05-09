; DESCRIPTION: Composite: Places a cyan 44x100 rectangle at position (58, 122) then Renders a blue line between points (229, 78) and (107, 104).
; PLAN: r0=58(x), r1=122(y), r2=44(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=78(y1), r7=107(x2), r8=104(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 122
LDI r2, 44
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 78
LDI r7, 107
LDI r8, 104
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
