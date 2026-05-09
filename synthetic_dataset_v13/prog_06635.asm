; DESCRIPTION: Composite: Places a red 44x61 rectangle at position (69, 42) then Sets a single white pixel at (164, 207).
; PLAN: r0=69(x), r1=42(y), r2=44(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=207(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 42
LDI r2, 44
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 207
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
