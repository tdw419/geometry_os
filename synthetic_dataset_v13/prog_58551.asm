; DESCRIPTION: Places a cyan 12x103 rectangle at position (493, 90).
; PLAN: r0=493(x), r1=90(y), r2=12(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 90
LDI r2, 12
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
