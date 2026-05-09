; DESCRIPTION: Places a green 93x43 rectangle at position (405, 66).
; PLAN: r0=405(x), r1=66(y), r2=93(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 66
LDI r2, 93
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
