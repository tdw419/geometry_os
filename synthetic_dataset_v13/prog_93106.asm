; DESCRIPTION: Composite: Places a white 55x93 rectangle at position (349, 21) then Sets a single purple pixel at (16, 133).
; PLAN: r0=349(x), r1=21(y), r2=55(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=133(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 21
LDI r2, 55
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 133
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
