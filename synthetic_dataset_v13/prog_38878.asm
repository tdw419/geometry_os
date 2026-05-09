; DESCRIPTION: Composite: Places a yellow dot at position (352, 52) then Places a orange 56x90 rectangle at position (68, 150).
; PLAN: r0=352(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=150(y), r7=56(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 150
LDI r7, 56
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
