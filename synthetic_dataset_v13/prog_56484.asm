; DESCRIPTION: Composite: Places a cyan line segment connecting (310, 173) to (354, 94) then Renders a orange box of size 107x77 starting at (33, 12).
; PLAN: r0=310(x1), r1=173(y1), r2=354(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=12(y), r7=107(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 173
LDI r2, 354
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 12
LDI r7, 107
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
