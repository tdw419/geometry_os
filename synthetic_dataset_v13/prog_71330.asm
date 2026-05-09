; DESCRIPTION: Composite: Sets a single magenta pixel at (160, 239) then Places a red 107x64 rectangle at position (131, 142).
; PLAN: r0=160(x), r1=239(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=142(y), r7=107(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 239
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 142
LDI r7, 107
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
