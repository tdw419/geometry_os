; DESCRIPTION: Places a cyan 41x59 rectangle at position (221, 64).
; PLAN: r0=221(x), r1=64(y), r2=41(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 64
LDI r2, 41
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
