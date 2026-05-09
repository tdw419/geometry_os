; DESCRIPTION: Composite: Renders a orange box of size 31x92 starting at (365, 8) then Places a yellow dot at position (34, 3).
; PLAN: r0=365(x), r1=8(y), r2=31(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=3(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 8
LDI r2, 31
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 3
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
