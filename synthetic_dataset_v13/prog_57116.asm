; DESCRIPTION: Composite: Places a orange 63x34 rectangle at position (388, 187) then Places a blue dot at position (191, 105).
; PLAN: r0=388(x), r1=187(y), r2=63(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 187
LDI r2, 63
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
