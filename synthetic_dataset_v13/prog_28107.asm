; DESCRIPTION: Composite: Sets a single orange pixel at (441, 186) then Renders a cyan box of size 39x120 starting at (359, 30).
; PLAN: r0=441(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=30(y), r7=39(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 359
LDI r6, 30
LDI r7, 39
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
