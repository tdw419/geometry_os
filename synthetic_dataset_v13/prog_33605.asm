; DESCRIPTION: Places a cyan 87x92 rectangle at position (283, 45).
; PLAN: r0=283(x), r1=45(y), r2=87(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 45
LDI r2, 87
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
