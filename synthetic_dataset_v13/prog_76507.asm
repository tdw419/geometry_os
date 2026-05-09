; DESCRIPTION: Composite: Places a green circle of radius 22 at center (213, 79) then Places a red 83x106 rectangle at position (176, 126).
; PLAN: r0=213(x), r1=79(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=126(y), r7=83(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 79
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 126
LDI r7, 83
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
