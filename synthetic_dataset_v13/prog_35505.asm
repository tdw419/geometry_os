; DESCRIPTION: Composite: Renders a purple box of size 18x60 starting at (224, 45) then Places a orange line segment connecting (287, 67) to (153, 21).
; PLAN: r0=224(x), r1=45(y), r2=18(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=67(y1), r7=153(x2), r8=21(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 45
LDI r2, 18
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 67
LDI r7, 153
LDI r8, 21
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
