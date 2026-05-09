; DESCRIPTION: Places a cyan 111x49 rectangle at position (102, 32).
; PLAN: r0=102(x), r1=32(y), r2=111(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 32
LDI r2, 111
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
