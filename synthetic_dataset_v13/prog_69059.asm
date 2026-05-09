; DESCRIPTION: Places a cyan 37x77 rectangle at position (120, 170).
; PLAN: r0=120(x), r1=170(y), r2=37(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 170
LDI r2, 37
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
