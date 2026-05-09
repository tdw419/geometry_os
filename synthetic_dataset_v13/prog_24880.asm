; DESCRIPTION: Creates a orange circular shape at (235, 228) with radius 27.
; PLAN: r0=235(x), r1=228(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 228
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
