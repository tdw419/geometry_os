; DESCRIPTION: Composite: Places a purple line segment connecting (462, 175) to (389, 138) then Renders a cyan box of size 42x107 starting at (284, 28).
; PLAN: r0=462(x1), r1=175(y1), r2=389(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=28(y), r7=42(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 175
LDI r2, 389
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 28
LDI r7, 42
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
