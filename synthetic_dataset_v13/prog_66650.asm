; DESCRIPTION: Composite: Sets a single orange pixel at (0, 59) then Renders a green box of size 52x10 starting at (143, 79).
; PLAN: r0=0(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=79(y), r7=52(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 143
LDI r6, 79
LDI r7, 52
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
