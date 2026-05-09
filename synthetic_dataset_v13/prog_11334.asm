; DESCRIPTION: Composite: Sets a single green pixel at (129, 37) then Renders a red box of size 103x120 starting at (394, 121).
; PLAN: r0=129(x), r1=37(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=121(y), r7=103(width), r8=120(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 37
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 394
LDI r6, 121
LDI r7, 103
LDI r8, 120
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
