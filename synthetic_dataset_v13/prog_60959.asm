; DESCRIPTION: Composite: Places a red 16x75 rectangle at position (181, 16) then Places a magenta dot at position (239, 48).
; PLAN: r0=181(x), r1=16(y), r2=16(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=48(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 16
LDI r2, 16
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 48
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
