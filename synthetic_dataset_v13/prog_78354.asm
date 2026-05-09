; DESCRIPTION: Places a cyan 46x12 rectangle at position (102, 127).
; PLAN: r0=102(x), r1=127(y), r2=46(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 127
LDI r2, 46
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
