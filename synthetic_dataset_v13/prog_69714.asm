; DESCRIPTION: Composite: Sets a single purple pixel at (187, 128) then Renders a red box of size 110x60 starting at (118, 67).
; PLAN: r0=187(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=67(y), r7=110(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 67
LDI r7, 110
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
