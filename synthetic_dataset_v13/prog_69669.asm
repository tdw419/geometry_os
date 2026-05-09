; DESCRIPTION: Composite: Places a black 89x82 rectangle at position (317, 24) then Places a orange circle of radius 70 at center (366, 164).
; PLAN: r0=317(x), r1=24(y), r2=89(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=164(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 317
LDI r1, 24
LDI r2, 89
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 164
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
