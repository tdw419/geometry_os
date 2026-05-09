; DESCRIPTION: Composite: Places a green 92x45 rectangle at position (103, 48) then Sets a single purple pixel at (368, 6).
; PLAN: r0=103(x), r1=48(y), r2=92(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=6(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 48
LDI r2, 92
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 6
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
