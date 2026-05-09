; DESCRIPTION: Places a cyan 46x19 rectangle at position (138, 132).
; PLAN: r0=138(x), r1=132(y), r2=46(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 132
LDI r2, 46
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
