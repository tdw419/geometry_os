; DESCRIPTION: Composite: Creates a red circular shape at (145, 161) with radius 51 then Places a orange 26x48 rectangle at position (410, 8).
; PLAN: r0=145(x), r1=161(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=8(y), r7=26(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 161
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 8
LDI r7, 26
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
