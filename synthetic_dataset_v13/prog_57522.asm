; DESCRIPTION: Composite: Places a yellow dot at position (308, 77) then Renders a cyan box of size 36x76 starting at (338, 103).
; PLAN: r0=308(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=103(y), r7=36(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 103
LDI r7, 36
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
