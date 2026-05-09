; DESCRIPTION: Composite: Sets a single yellow pixel at (398, 219) then Places a red 114x61 rectangle at position (38, 165).
; PLAN: r0=398(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=165(y), r7=114(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 38
LDI r6, 165
LDI r7, 114
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
