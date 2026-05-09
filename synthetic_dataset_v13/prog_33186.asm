; DESCRIPTION: Composite: Places a purple 103x86 rectangle at position (33, 109) then Sets a single magenta pixel at (37, 225).
; PLAN: r0=33(x), r1=109(y), r2=103(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=225(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 109
LDI r2, 103
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 225
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
