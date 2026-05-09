; DESCRIPTION: Composite: Places a cyan 92x41 rectangle at position (76, 123) then Places a magenta line segment connecting (414, 88) to (437, 58).
; PLAN: r0=76(x), r1=123(y), r2=92(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x1), r6=88(y1), r7=437(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 123
LDI r2, 92
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 88
LDI r7, 437
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
