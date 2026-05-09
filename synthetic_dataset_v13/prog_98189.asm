; DESCRIPTION: Composite: Places a white 109x82 rectangle at position (286, 69) then Sets a single red pixel at (504, 173).
; PLAN: r0=286(x), r1=69(y), r2=109(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=173(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 69
LDI r2, 109
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 173
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
