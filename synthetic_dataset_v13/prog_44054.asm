; DESCRIPTION: Composite: Places a green 84x110 rectangle at position (360, 41) then Sets a single magenta pixel at (164, 154).
; PLAN: r0=360(x), r1=41(y), r2=84(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=154(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 41
LDI r2, 84
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 154
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
