; DESCRIPTION: Composite: Renders a orange box of size 10x27 starting at (164, 172) then Places a cyan line segment connecting (274, 217) to (24, 155).
; PLAN: r0=164(x), r1=172(y), r2=10(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=217(y1), r7=24(x2), r8=155(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 172
LDI r2, 10
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 217
LDI r7, 24
LDI r8, 155
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
