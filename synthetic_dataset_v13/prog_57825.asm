; DESCRIPTION: Composite: Places a magenta 94x99 rectangle at position (188, 39) then Sets a single white pixel at (445, 184).
; PLAN: r0=188(x), r1=39(y), r2=94(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=184(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 39
LDI r2, 94
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 184
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
