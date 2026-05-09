; DESCRIPTION: Places a cyan 72x77 rectangle at position (141, 1).
; PLAN: r0=141(x), r1=1(y), r2=72(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 1
LDI r2, 72
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
