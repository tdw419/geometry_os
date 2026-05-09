; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (127, 195) then Places a orange 19x68 rectangle at position (157, 106).
; PLAN: r0=127(x), r1=195(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=106(y), r7=19(width), r8=68(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 195
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 106
LDI r7, 19
LDI r8, 68
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
