; DESCRIPTION: Creates a cyan circular shape at (215, 173) with radius 72.
; PLAN: r0=215(x), r1=173(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 173
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
