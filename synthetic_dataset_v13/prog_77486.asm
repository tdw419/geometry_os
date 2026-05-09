; DESCRIPTION: Places a cyan circle of radius 42 at center (245, 173).
; PLAN: r0=245(x), r1=173(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 173
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
