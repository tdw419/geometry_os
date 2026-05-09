; DESCRIPTION: Composite: Sets a single purple pixel at (401, 40) then Renders a magenta box of size 17x76 starting at (284, 110).
; PLAN: r0=401(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=110(y), r7=17(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 110
LDI r7, 17
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
