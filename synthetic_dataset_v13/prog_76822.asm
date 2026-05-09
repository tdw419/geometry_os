; DESCRIPTION: Places a yellow 70x86 rectangle at position (304, 166).
; PLAN: r0=304(x), r1=166(y), r2=70(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 166
LDI r2, 70
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
