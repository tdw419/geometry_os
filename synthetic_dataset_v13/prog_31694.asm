; DESCRIPTION: Composite: Places a cyan dot at position (270, 149) then Renders a black box of size 28x53 starting at (348, 108).
; PLAN: r0=270(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=108(y), r7=28(width), r8=53(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 108
LDI r7, 28
LDI r8, 53
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
