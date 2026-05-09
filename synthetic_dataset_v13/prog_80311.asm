; DESCRIPTION: Composite: Places a black dot at position (374, 120) then Places a red 102x33 rectangle at position (79, 84).
; PLAN: r0=374(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=84(y), r7=102(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 79
LDI r6, 84
LDI r7, 102
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
