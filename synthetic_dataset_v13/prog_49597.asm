; DESCRIPTION: Composite: Sets a single red pixel at (196, 168) then Places a purple 77x120 rectangle at position (187, 121).
; PLAN: r0=196(x), r1=168(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=121(y), r7=77(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 168
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 187
LDI r6, 121
LDI r7, 77
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
