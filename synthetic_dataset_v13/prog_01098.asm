; DESCRIPTION: Places a cyan 68x18 rectangle at position (414, 71).
; PLAN: r0=414(x), r1=71(y), r2=68(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 71
LDI r2, 68
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
