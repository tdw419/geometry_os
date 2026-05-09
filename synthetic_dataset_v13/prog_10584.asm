; DESCRIPTION: Places a cyan 82x81 rectangle at position (388, 65).
; PLAN: r0=388(x), r1=65(y), r2=82(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 65
LDI r2, 82
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
