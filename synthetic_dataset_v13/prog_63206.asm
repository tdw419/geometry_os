; DESCRIPTION: Places a cyan 102x60 rectangle at position (279, 86).
; PLAN: r0=279(x), r1=86(y), r2=102(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 86
LDI r2, 102
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
