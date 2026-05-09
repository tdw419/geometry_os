; DESCRIPTION: Composite: Places a cyan line segment connecting (97, 3) to (64, 174) then Places a orange 88x41 rectangle at position (242, 131).
; PLAN: r0=97(x1), r1=3(y1), r2=64(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=131(y), r7=88(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 3
LDI r2, 64
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 131
LDI r7, 88
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
