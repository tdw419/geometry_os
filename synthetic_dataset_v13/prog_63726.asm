; DESCRIPTION: Composite: Places a red dot at position (195, 123) then Places a yellow 88x40 rectangle at position (176, 37).
; PLAN: r0=195(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=37(y), r7=88(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 176
LDI r6, 37
LDI r7, 88
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
