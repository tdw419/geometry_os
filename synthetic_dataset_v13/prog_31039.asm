; DESCRIPTION: Composite: Places a cyan dot at position (5, 168) then Draws a white circle centered at (301, 148) with radius 52.
; PLAN: r0=5(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=148(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 148
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
