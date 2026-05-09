; DESCRIPTION: Places a cyan 68x77 rectangle at position (81, 161).
; PLAN: r0=81(x), r1=161(y), r2=68(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 161
LDI r2, 68
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
