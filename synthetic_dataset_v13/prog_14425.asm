; DESCRIPTION: Composite: Places a orange dot at position (433, 151) then Places a purple 28x82 rectangle at position (137, 83).
; PLAN: r0=433(x), r1=151(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=83(y), r7=28(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 151
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 137
LDI r6, 83
LDI r7, 28
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
