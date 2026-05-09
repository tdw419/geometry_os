; DESCRIPTION: Places a black 27x50 rectangle at position (458, 188).
; PLAN: r0=458(x), r1=188(y), r2=27(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 188
LDI r2, 27
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
