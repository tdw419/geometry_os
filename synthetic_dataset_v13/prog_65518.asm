; DESCRIPTION: Composite: Places a yellow 72x45 rectangle at position (387, 180) then Places a magenta dot at position (467, 219).
; PLAN: r0=387(x), r1=180(y), r2=72(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=219(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 180
LDI r2, 72
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 219
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
