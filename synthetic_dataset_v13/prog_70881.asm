; DESCRIPTION: Composite: Draws a red rectangle at (354, 97) with width 97 and height 99 then Places a cyan line segment connecting (299, 244) to (191, 39).
; PLAN: r0=354(x), r1=97(y), r2=97(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=244(y1), r7=191(x2), r8=39(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 97
LDI r2, 97
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 244
LDI r7, 191
LDI r8, 39
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
