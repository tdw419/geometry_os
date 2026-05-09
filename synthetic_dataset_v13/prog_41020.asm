; DESCRIPTION: Composite: Places a yellow 109x72 rectangle at position (400, 82) then Sets a single green pixel at (281, 202).
; PLAN: r0=400(x), r1=82(y), r2=109(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 82
LDI r2, 109
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
