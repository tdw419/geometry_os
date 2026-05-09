; DESCRIPTION: Composite: Places a cyan 12x34 rectangle at position (152, 117) then Places a cyan dot at position (462, 81).
; PLAN: r0=152(x), r1=117(y), r2=12(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=81(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 117
LDI r2, 12
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 81
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
