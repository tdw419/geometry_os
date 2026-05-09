; DESCRIPTION: Draws a cyan circle centered at (276, 82) with radius 79.
; PLAN: r0=276(x), r1=82(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 82
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
