; DESCRIPTION: Composite: Draws a orange rectangle at (356, 141) with width 103 and height 47 then Places a orange line segment connecting (294, 66) to (492, 164).
; PLAN: r0=356(x), r1=141(y), r2=103(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=66(y1), r7=492(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 141
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 66
LDI r7, 492
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
