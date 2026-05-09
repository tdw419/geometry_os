; DESCRIPTION: Places a cyan 91x82 rectangle at position (363, 87).
; PLAN: r0=363(x), r1=87(y), r2=91(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 87
LDI r2, 91
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
