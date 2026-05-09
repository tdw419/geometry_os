; DESCRIPTION: Composite: Renders a cyan disk with center (103, 87) and radius 78 then Renders a orange box of size 41x21 starting at (252, 235).
; PLAN: r0=103(x), r1=87(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=235(y), r7=41(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 87
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 235
LDI r7, 41
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
