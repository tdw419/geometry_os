; DESCRIPTION: Composite: Places a cyan 57x93 rectangle at position (150, 89) then Creates a cyan circular shape at (419, 168) with radius 31.
; PLAN: r0=150(x), r1=89(y), r2=57(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=168(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 89
LDI r2, 57
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 168
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
