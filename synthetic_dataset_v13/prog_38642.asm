; DESCRIPTION: Places a cyan 21x46 rectangle at position (458, 81).
; PLAN: r0=458(x), r1=81(y), r2=21(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 81
LDI r2, 21
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
