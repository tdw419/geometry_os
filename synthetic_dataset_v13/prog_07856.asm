; DESCRIPTION: Places a cyan 92x62 rectangle at position (265, 172).
; PLAN: r0=265(x), r1=172(y), r2=92(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 172
LDI r2, 92
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
