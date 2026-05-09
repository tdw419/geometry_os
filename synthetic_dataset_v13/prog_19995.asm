; DESCRIPTION: Composite: Places a purple 55x117 rectangle at position (168, 16) then Sets a single orange pixel at (333, 3).
; PLAN: r0=168(x), r1=16(y), r2=55(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=3(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 16
LDI r2, 55
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 3
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
