; DESCRIPTION: Places a white dot at position (224, 173).
; PLAN: r0=224(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
