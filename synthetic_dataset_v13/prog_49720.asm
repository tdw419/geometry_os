; DESCRIPTION: Composite: Places a cyan dot at position (8, 30) then Places a yellow 50x105 rectangle at position (429, 51).
; PLAN: r0=8(x), r1=30(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=51(y), r7=50(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 30
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 51
LDI r7, 50
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
