; DESCRIPTION: Composite: Renders a cyan box of size 117x70 starting at (54, 4) then Sets a single black pixel at (138, 234).
; PLAN: r0=54(x), r1=4(y), r2=117(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=234(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 4
LDI r2, 117
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 234
LDI r7, 0x000000
PSET r5, r6, r7
HALT
