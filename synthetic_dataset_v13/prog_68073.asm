; DESCRIPTION: Places a cyan 18x108 rectangle at position (228, 107).
; PLAN: r0=228(x), r1=107(y), r2=18(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 107
LDI r2, 18
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
