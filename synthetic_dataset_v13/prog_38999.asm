; DESCRIPTION: Places a cyan 114x49 rectangle at position (209, 193).
; PLAN: r0=209(x), r1=193(y), r2=114(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 193
LDI r2, 114
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
