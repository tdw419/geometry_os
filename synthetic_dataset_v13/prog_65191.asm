; DESCRIPTION: Places a cyan 111x32 rectangle at position (337, 30).
; PLAN: r0=337(x), r1=30(y), r2=111(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 30
LDI r2, 111
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
