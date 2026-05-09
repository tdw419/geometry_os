; DESCRIPTION: Composite: Places a cyan 71x69 rectangle at position (90, 80) then Sets a single yellow pixel at (106, 70).
; PLAN: r0=90(x), r1=80(y), r2=71(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 80
LDI r2, 71
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
