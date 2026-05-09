; DESCRIPTION: Composite: Places a purple dot at position (284, 233) then Creates a orange rectangular region at (26, 147) spanning 16 by 25 pixels.
; PLAN: r0=284(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=147(y), r7=16(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 147
LDI r7, 16
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
