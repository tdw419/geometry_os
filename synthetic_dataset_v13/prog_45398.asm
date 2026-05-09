; DESCRIPTION: Composite: Places a green 38x113 rectangle at position (437, 127) then Sets a single yellow pixel at (124, 179).
; PLAN: r0=437(x), r1=127(y), r2=38(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=179(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 127
LDI r2, 38
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 179
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
