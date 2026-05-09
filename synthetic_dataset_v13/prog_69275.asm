; DESCRIPTION: Composite: Places a green 92x109 rectangle at position (218, 115) then Sets a single magenta pixel at (18, 205).
; PLAN: r0=218(x), r1=115(y), r2=92(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=205(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 115
LDI r2, 92
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 205
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
