; DESCRIPTION: Composite: Places a black line segment connecting (213, 178) to (319, 192) then Places a black 93x97 rectangle at position (397, 39).
; PLAN: r0=213(x1), r1=178(y1), r2=319(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=39(y), r7=93(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 178
LDI r2, 319
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 39
LDI r7, 93
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
