; DESCRIPTION: Places a cyan 56x113 rectangle at position (341, 23).
; PLAN: r0=341(x), r1=23(y), r2=56(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 23
LDI r2, 56
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
