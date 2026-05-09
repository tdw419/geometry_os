; DESCRIPTION: Composite: Places a orange dot at position (27, 201) then Renders a yellow box of size 26x59 starting at (213, 190).
; PLAN: r0=27(x), r1=201(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=190(y), r7=26(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 201
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 213
LDI r6, 190
LDI r7, 26
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
