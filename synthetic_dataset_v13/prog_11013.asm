; DESCRIPTION: Composite: Places a green dot at position (209, 148) then Places a orange 32x38 rectangle at position (4, 194).
; PLAN: r0=209(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=194(y), r7=32(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 4
LDI r6, 194
LDI r7, 32
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
