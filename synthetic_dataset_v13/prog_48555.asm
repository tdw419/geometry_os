; DESCRIPTION: Composite: Renders a blue box of size 104x97 starting at (34, 41) then Places a cyan dot at position (16, 223).
; PLAN: r0=34(x), r1=41(y), r2=104(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=223(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 41
LDI r2, 104
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 223
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
