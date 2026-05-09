; DESCRIPTION: Composite: Places a purple dot at position (252, 239) then Places a magenta 106x52 rectangle at position (314, 50).
; PLAN: r0=252(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=50(y), r7=106(width), r8=52(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 50
LDI r7, 106
LDI r8, 52
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
