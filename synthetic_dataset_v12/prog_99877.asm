; DESCRIPTION: Composite: Places a red dot at position (401, 102) then Places a cyan 83x77 rectangle at position (416, 125).
; PLAN: r0=401(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=125(y), r7=83(width), r8=77(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 125
LDI r7, 83
LDI r8, 77
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
