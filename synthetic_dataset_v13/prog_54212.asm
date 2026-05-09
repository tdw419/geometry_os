; DESCRIPTION: Composite: Sets a single green pixel at (256, 39) then Renders a red box of size 27x33 starting at (85, 64).
; PLAN: r0=256(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=64(y), r7=27(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 64
LDI r7, 27
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
