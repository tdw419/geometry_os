; DESCRIPTION: Composite: Places a orange dot at position (479, 32) then Places a purple 113x98 rectangle at position (223, 85).
; PLAN: r0=479(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=85(y), r7=113(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 223
LDI r6, 85
LDI r7, 113
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
