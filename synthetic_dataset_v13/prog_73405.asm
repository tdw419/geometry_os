; DESCRIPTION: Composite: Places a orange dot at position (90, 44) then Places a yellow 106x21 rectangle at position (352, 160).
; PLAN: r0=90(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=160(y), r7=106(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 352
LDI r6, 160
LDI r7, 106
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
