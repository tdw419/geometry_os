; DESCRIPTION: Composite: Renders a white box of size 119x21 starting at (344, 209) then Places a magenta dot at position (448, 157).
; PLAN: r0=344(x), r1=209(y), r2=119(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=157(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 209
LDI r2, 119
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 157
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
