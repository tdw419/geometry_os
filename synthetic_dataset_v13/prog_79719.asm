; DESCRIPTION: Composite: Sets a single red pixel at (363, 188) then Places a green 30x25 rectangle at position (278, 46).
; PLAN: r0=363(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=46(y), r7=30(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 278
LDI r6, 46
LDI r7, 30
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
