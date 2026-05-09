; DESCRIPTION: Composite: Places a orange 92x61 rectangle at position (293, 36) then Sets a single orange pixel at (372, 152).
; PLAN: r0=293(x), r1=36(y), r2=92(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=152(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 36
LDI r2, 92
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 152
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
