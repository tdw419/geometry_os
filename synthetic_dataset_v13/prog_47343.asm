; DESCRIPTION: Composite: Renders a purple disk with center (370, 207) and radius 16 then Renders a orange box of size 41x62 starting at (241, 173).
; PLAN: r0=370(x), r1=207(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=173(y), r7=41(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 207
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 173
LDI r7, 41
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
