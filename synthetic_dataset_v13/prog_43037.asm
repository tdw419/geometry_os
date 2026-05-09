; DESCRIPTION: Composite: Places a green 50x110 rectangle at position (160, 67) then Places a black dot at position (140, 89).
; PLAN: r0=160(x), r1=67(y), r2=50(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=89(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 67
LDI r2, 50
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 89
LDI r7, 0x000000
PSET r5, r6, r7
HALT
