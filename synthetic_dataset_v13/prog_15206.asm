; DESCRIPTION: Composite: Renders a white box of size 42x40 starting at (409, 135) then Places a magenta dot at position (110, 98).
; PLAN: r0=409(x), r1=135(y), r2=42(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=98(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 135
LDI r2, 42
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 98
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
