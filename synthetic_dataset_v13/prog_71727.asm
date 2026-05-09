; DESCRIPTION: Composite: Places a yellow dot at position (77, 200) then Places a red 76x16 rectangle at position (268, 214).
; PLAN: r0=77(x), r1=200(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=214(y), r7=76(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 200
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 268
LDI r6, 214
LDI r7, 76
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
