; DESCRIPTION: Composite: Places a yellow dot at position (368, 161) then Places a red 106x31 rectangle at position (291, 128).
; PLAN: r0=368(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=128(y), r7=106(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 128
LDI r7, 106
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
