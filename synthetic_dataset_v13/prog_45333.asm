; DESCRIPTION: Composite: Places a cyan line segment connecting (216, 114) to (23, 3) then Renders a black box of size 32x55 starting at (68, 152).
; PLAN: r0=216(x1), r1=114(y1), r2=23(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=152(y), r7=32(width), r8=55(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 114
LDI r2, 23
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 152
LDI r7, 32
LDI r8, 55
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
