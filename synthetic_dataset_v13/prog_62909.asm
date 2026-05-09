; DESCRIPTION: Places a cyan 71x77 rectangle at position (309, 83).
; PLAN: r0=309(x), r1=83(y), r2=71(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 83
LDI r2, 71
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
