; DESCRIPTION: Composite: Places a cyan 38x41 rectangle at position (149, 124) then Sets a single purple pixel at (465, 212).
; PLAN: r0=149(x), r1=124(y), r2=38(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 124
LDI r2, 38
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
