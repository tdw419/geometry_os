; DESCRIPTION: Composite: Places a orange dot at position (343, 209) then Places a red 61x84 rectangle at position (288, 91).
; PLAN: r0=343(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=91(y), r7=61(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 288
LDI r6, 91
LDI r7, 61
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
