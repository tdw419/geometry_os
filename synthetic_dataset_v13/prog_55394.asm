; DESCRIPTION: Creates a cyan rectangular region at (449, 114) spanning 23 by 45 pixels.
; PLAN: r0=449(x), r1=114(y), r2=23(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 114
LDI r2, 23
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
