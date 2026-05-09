; DESCRIPTION: Composite: Draws a white rectangle at (404, 63) with width 43 and height 103 then Sets a single cyan pixel at (97, 206).
; PLAN: r0=404(x), r1=63(y), r2=43(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=206(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 63
LDI r2, 43
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 206
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
