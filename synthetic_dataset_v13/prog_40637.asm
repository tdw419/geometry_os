; DESCRIPTION: Composite: Places a red dot at position (82, 14) then Renders a white box of size 38x74 starting at (374, 86).
; PLAN: r0=82(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=86(y), r7=38(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 374
LDI r6, 86
LDI r7, 38
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
