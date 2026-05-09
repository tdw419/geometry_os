; DESCRIPTION: Composite: Sets a single cyan pixel at (337, 136) then Places a cyan 86x81 rectangle at position (404, 35).
; PLAN: r0=337(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=35(y), r7=86(width), r8=81(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 35
LDI r7, 86
LDI r8, 81
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
