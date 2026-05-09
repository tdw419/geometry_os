; DESCRIPTION: Composite: Places a white 60x25 rectangle at position (152, 134) then Sets a single green pixel at (102, 171).
; PLAN: r0=152(x), r1=134(y), r2=60(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=171(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 134
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 171
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
