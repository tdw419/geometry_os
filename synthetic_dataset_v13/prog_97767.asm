; DESCRIPTION: Composite: Places a orange 120x20 rectangle at position (25, 200) then Sets a single red pixel at (440, 44).
; PLAN: r0=25(x), r1=200(y), r2=120(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=44(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 200
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 44
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
