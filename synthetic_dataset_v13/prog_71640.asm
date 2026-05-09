; DESCRIPTION: Composite: Places a black dot at position (89, 195) then Renders a cyan box of size 52x76 starting at (218, 89).
; PLAN: r0=89(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=89(y), r7=52(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 218
LDI r6, 89
LDI r7, 52
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
