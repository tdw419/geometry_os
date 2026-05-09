; DESCRIPTION: Composite: Renders a red box of size 95x41 starting at (73, 74) then Places a magenta dot at position (205, 192).
; PLAN: r0=73(x), r1=74(y), r2=95(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=192(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 74
LDI r2, 95
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 192
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
