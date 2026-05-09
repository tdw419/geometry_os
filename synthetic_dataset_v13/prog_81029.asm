; DESCRIPTION: Composite: Draws a white line from (128, 12) to (397, 185) then Renders a blue box of size 101x53 starting at (409, 99).
; PLAN: r0=128(x1), r1=12(y1), r2=397(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=99(y), r7=101(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 12
LDI r2, 397
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 99
LDI r7, 101
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
