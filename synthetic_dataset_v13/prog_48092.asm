; DESCRIPTION: Composite: Sets a single blue pixel at (284, 236) then Creates a purple rectangular region at (326, 4) spanning 117 by 10 pixels.
; PLAN: r0=284(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=4(y), r7=117(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 4
LDI r7, 117
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
