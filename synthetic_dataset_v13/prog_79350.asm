; DESCRIPTION: Composite: Sets a single white pixel at (433, 1) then Places a white 97x19 rectangle at position (240, 206).
; PLAN: r0=433(x), r1=1(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=206(y), r7=97(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 206
LDI r7, 97
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
