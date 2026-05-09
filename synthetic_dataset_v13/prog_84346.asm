; DESCRIPTION: Places a cyan 82x18 rectangle at position (3, 21).
; PLAN: r0=3(x), r1=21(y), r2=82(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 21
LDI r2, 82
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
