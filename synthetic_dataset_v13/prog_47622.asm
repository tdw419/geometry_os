; DESCRIPTION: Composite: Sets a single white pixel at (28, 248) then Renders a red box of size 12x39 starting at (57, 50).
; PLAN: r0=28(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=50(y), r7=12(width), r8=39(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 50
LDI r7, 12
LDI r8, 39
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
