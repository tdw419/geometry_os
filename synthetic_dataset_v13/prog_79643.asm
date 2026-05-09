; DESCRIPTION: Places a cyan 101x77 rectangle at position (143, 25).
; PLAN: r0=143(x), r1=25(y), r2=101(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 25
LDI r2, 101
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
