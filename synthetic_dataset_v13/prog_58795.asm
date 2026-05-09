; DESCRIPTION: Composite: Renders a orange disk with center (401, 174) and radius 22 then Draws a cyan rectangle at (171, 50) with width 82 and height 107.
; PLAN: r0=401(x), r1=174(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=50(y), r7=82(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 174
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 50
LDI r7, 82
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
